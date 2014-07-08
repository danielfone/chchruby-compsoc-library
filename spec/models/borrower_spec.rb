require 'rails_helper'

describe Borrower do
  subject(:borrower) { described_class.new }

  it 'should automatically generate a code if none is provided' do
    borrower = build :borrower
    expect(borrower.code).to be_nil
    borrower.save!
    expect(borrower.code).to match /\w{5}/
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
end
