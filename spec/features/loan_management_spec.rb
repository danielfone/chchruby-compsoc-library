require 'rails_helper'

feature 'Loan management' do

  scenario 'Issue a book to a borrower' do
    create :borrower, name: 'Fred'
    create :book, title: 'The Holistic Detective Agency'

    visit borrowers_path
    click_link 'Issue'
    click_on 'Issue'
    expect(page).to have_content <<-PAGE
      Current Loans

      Book                            Due
      The Holistic Detective Agency
    PAGE
  end

  scenario 'Return a book via book list' do
    borrower = create :borrower, name: 'Fred'
    create :book, title: 'The Holistic Detective Agency', borrower: borrower

    visit books_path
    click_on 'Return'
    expect(page).not_to have_link 'Return'
  end

  scenario 'Return a book via borrower' do
    borrower = create :borrower, name: 'Fred'
    create :book, title: 'The Holistic Detective Agency', borrower: borrower

    visit loans_borrower_path(borrower)
    click_on 'Return'
    expect(page).not_to have_link 'Return'
  end


end
