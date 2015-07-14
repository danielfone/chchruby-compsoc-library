require 'rails_helper'

describe Library do
  is_pending = true

  let(:book) { Book.new }
  let(:borrower) { Borrower.new }

  describe '#issue_book' do

    it 'should issue the book' do
      Library.issue_book book, borrower, 14
      expect(book.borrower).to eq borrower
      expect(book.due_on).to eq Time.zone.today + 14
      expect(book).to be_on_loan
      expect(borrower.books).to include book
    end

    it 'should default to a 3 week loan' do
      Library.issue_book book, borrower
      expect(book.due_on).to eq Time.zone.today + 21
    end

    it 'should not issue more books than a borrower is allowed', pending: is_pending do
      book2 = Book.new
      Library.issue_book book2, borrower

      borrower.limit = 1
      expect { Library.issue_book book, borrower }.to raise_error Library::LimitReachedError
      expect(book).not_to be_on_loan
      expect(book.borrower).to be_nil
      expect(borrower.books).not_to include book
    end

    it 'should not issue a book already on loan' do
      borrower2 = Borrower.new
      Library.issue_book book, borrower2

      expect { Library.issue_book book, borrower }.to raise_error Library::AlreadyOnLoanError
      expect(borrower.books).not_to include book
    end

    it 'should not issue books to borrowers with overdue loans', pending: is_pending do
      # Fix spec/models/borrower_spec.rb
      book2 = Book.new
      Library.issue_book book2, borrower, -1

      expect { Library.issue_book book, borrower }.to raise_error Library::OverdueLoanError
      expect(book).not_to be_on_loan
      expect(book.borrower).to be_nil
      expect(borrower.books).not_to include book
    end

  end

end
