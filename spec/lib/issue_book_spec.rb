require 'compsoc-library/library'
require 'active_support/core_ext'

module CompsocLibrary
  describe Library do
    let(:book) { Book.new }
    let(:borrower) { Borrower.new }

    describe '#issue_book' do
      it 'should issue the book' do
        Library.issue_book book, borrower, 2.weeks
        expect(book.borrower).to eq borrower
        expect(book.due_on).to eq 2.weeks.from_now.to_date
        expect(book).to be_on_loan
        expect(borrower.books).to include book
      end

      it 'should default to a 3 week loan' do
        Library.issue_book book, borrower
        expect(book.due_on).to eq 3.weeks.from_now.to_date
      end

      it 'should not issue more books than a borrower is allowed' do
        book2 = Book.new
        Library.issue_book book2, borrower

        borrower.limit = 1
        expect { Library.issue_book book, borrower }.to raise_error LimitReachedError
        expect(book).not_to be_on_loan
        expect(book.borrower).to be_nil
        expect(borrower.books).not_to include book
      end

      it 'should not issue a book on loan' do
        borrower2 = Borrower.new
        Library.issue_book book, borrower2

        expect { Library.issue_book book, borrower }.to raise_error AlreadyOnLoanError
        expect(borrower.books).not_to include book
      end

      it 'should not issue books to borrowers with overdue loans' do
        book2 = Book.new
        Library.issue_book book2, borrower, -1.days

        expect { Library.issue_book book, borrower }.to raise_error OverdueLoanError
        expect(book).not_to be_on_loan
        expect(book.borrower).to be_nil
        expect(borrower.books).not_to include book
      end
    end

  end
end
