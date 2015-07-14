require 'rails_helper'

describe Book do
  subject(:book) { described_class.new }

  is_pending = false

  # RECOMMENDATION:
  # Create a book without an author through the web interface.
  # Try again once you've fixed this spec.
  # What do you think will happen when you try to update the existing one with a blank author?
  it 'should require an author', pending: is_pending do
    expect(book).to validate_presence_of :author
  end

  # You can see the effect of this on the books page when there are books on loan
  it 'should know the borrower name', pending: is_pending do
    expect(book.borrower_name).to be_nil
    book.borrower = Borrower.new name: 'Malcolm Reynolds'
    expect(book.borrower_name).to eq 'Malcolm Reynolds'
  end

  context 'when it has no due date' do
    it { should_not be_overdue }
  end

  context 'when the due date is today' do
    before { book.due_on = Date.today }
    it { should_not be_overdue }
  end

  context 'when the due date has passed', pending: is_pending do
    before { book.due_on = 2.days.ago }
    it { should be_overdue }
  end

  context 'when the due date is in the future' do
    before { book.due_on = 2.days.from_now }
    it { should_not be_overdue }
  end

  describe '#days_until_due' do
    it 'should be the number of days until due date', pending: is_pending do
      expect(book.days_until_due).to be_nil
      book.due_on = Date.today + 10
      expect(book.days_until_due).to eq 10
    end
  end

  describe '#keyword_array' do
    # This one is a little trickier
    it 'should be a lowercase array of all relevant words', pending: is_pending do
      expect(book.keyword_array).to be_empty

      book.title = 'Sqornshellous Swamptalk'
      book.author = 'Oolon Colluphid'
      book.keywords = 'ancient poet forests Long Lands dried Habra leaves'

      expect(book.keyword_array).to eq %w[
        sqornshellous
        swamptalk
        oolon
        colluphid
        ancient
        poet
        forests
        long
        lands
        dried
        habra
        leaves
      ]
    end
  end
end
