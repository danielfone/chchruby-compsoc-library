require 'rails_helper'

describe Library do
  let(:book) { Book.new }
  let(:borrower) { Borrower.new }

  describe '#return_book' do
    it 'should return the book' do
      Library.issue_book book, borrower
      Library.return_book book
      expect(book.borrower).to be_nil
      expect(book.due_on).to be_nil
      expect(book).not_to be_on_loan
      expect(borrower.books).not_to include book
    end

    it 'shoud fail on an unloaned book' do
      pending 'MEDIUM'
      expect { Library.return_book book }.to raise_error Library::NotOnLoanError
    end

  end

end
