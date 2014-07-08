require 'rails_helper'

describe Borrower do
  subject(:borrower) { described_class.new }

  it 'should automatically generate a code if none is provided' do
    pending 'MEDIUM'
    borrower = build :borrower
    expect(borrower.code).to be_nil
    borrower.save!
    expect(borrower.code).to match /B\d{5}/
  end

  describe '#overdue_books' do
    it 'should return books due before today' do
      pending 'MEDIUM'
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

  it 'should know the limits', pending: 'EASY' do
    expect(borrower).not_to be_at_limit
    borrower.limit = 1
    expect(borrower).not_to be_at_limit
    borrower.books << Book.new
    expect(borrower).to be_at_limit
    borrower.books << Book.new
    expect(borrower).to be_at_limit
  end

  describe '#current_loan_count', pending: 'EASY' do
    it 'should be the size of the borrowers book collection' do
      expect(borrower.current_loan_count).to eq 0
      borrower.books += build_list :book, 2
      expect(borrower.current_loan_count).to eq 2
    end
  end

  describe '#current_overdue_count', pending: 'EASY' do
    it 'should be the number of overdue books of the borrowers book collection' do
      expect(borrower.current_overdue_count).to eq 0
      borrower.books += build_list :book, 2
      borrower.books += build_list :book, 2, due_on: (Date.today-1)
      expect(borrower.current_overdue_count).to eq 2
    end
  end

end
