require 'rails_helper'

describe Borrower do
  subject(:borrower) { described_class.new }

  is_pending = true

  describe '#current_loan_count' do
    it 'should be the size of the borrowers book collection', pending: is_pending do
      expect(borrower.current_loan_count).to eq 0
      borrower.books += build_list :book, 2
      expect(borrower.current_loan_count).to eq 2
    end
  end

  describe '#at_limit?' do
    it 'should report whether borrow is at loan limit', pending: is_pending do
      expect(borrower).not_to be_at_limit
      borrower.limit = 1
      expect(borrower).not_to be_at_limit
      borrower.books << Book.new
      expect(borrower).to be_at_limit
      borrower.books << Book.new
      expect(borrower).to be_at_limit
    end
  end

  describe '#overdue_books' do
    # Have we written a method on Book that might help with this?
    it 'should return books due before today', pending: is_pending do
      book1 = Book.new due_on: 1.day.ago
      book2 = Book.new due_on: 2.days.ago
      book3 = Book.new due_on: Date.today

      borrower.books = [book1, book2, book3]

      expect(borrower.overdue_books).to eq [
        book1,
        book2,
      ]
    end
  end

  describe '#current_overdue_count' do
    it 'should be the number of overdue books of the borrowers book collection', pending: is_pending do
      expect(borrower.current_overdue_count).to eq 0
      borrower.books += build_list :book, 2
      borrower.books += build_list :book, 2, due_on: (Date.today-1)
      expect(borrower.current_overdue_count).to eq 2
    end
  end

  describe '#code' do
    it 'should be automatically generated if none is provided', pending: is_pending do
      borrower = build :borrower
      expect(borrower.code).to be_nil
      borrower.save!
      expect(borrower.code).to match /B\d{5}/
    end
  end

end
