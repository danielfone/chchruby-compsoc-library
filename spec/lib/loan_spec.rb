require 'compsoc-library/library'
require 'active_support/core_ext'

module CompsocLibrary
  describe Library do
    let(:book) { Book.new }
    let(:borrower) { Borrower.new }

    describe '#lend' do
      it 'should lend the book' do
        Library.lend book, borrower, 2.weeks
        expect(book.borrower).to eq borrower
        expect(book.due_on).to eq 2.weeks.from_now.to_date
        expect(book).to be_on_loan
        expect(borrower.books).to include book
      end

      it 'should default to a 3 week loan' do
        Library.lend book, borrower
        expect(book.due_on).to eq 3.weeks.from_now.to_date
      end

      it 'should not lend more books than a borrower is allowed' do
        book2 = Book.new
        Library.lend book2, borrower

        borrower.limit = 1
        expect { Library.lend book, borrower }.to raise_error LimitReachedError
        expect(book).not_to be_on_loan
        expect(book.borrower).to be_nil
        expect(borrower.books).not_to include book
      end

      it 'should not lend a book on loan' do
        borrower2 = Borrower.new
        Library.lend book, borrower2

        expect { Library.lend book, borrower }.to raise_error AlreadyOnLoanError
        expect(borrower.books).not_to include book
      end

      it 'should not lend books to borrowers with overdue loans' do
        book2 = Book.new
        Library.lend book2, borrower, -1.days

        expect { Library.lend book, borrower }.to raise_error OverdueLoanError
        expect(book).not_to be_on_loan
        expect(book.borrower).to be_nil
        expect(borrower.books).not_to include book
      end
    end

  end
end
