require 'compsoc-library/book'
require 'compsoc-library/borrower'

module CompsocLibrary
  class LibraryError < StandardError; end
  class LimitReachedError < LibraryError; end
  class AlreadyOnLoanError < LibraryError; end
  class OverdueLoanError < LibraryError; end
  class NotOnLoanError < LibraryError; end

  module Library
    module_function

    def issue_book(book, borrower, days=21)
      raise LimitReachedError if borrower.at_limit?
      raise AlreadyOnLoanError if book.on_loan?
      raise OverdueLoanError if borrower.overdue_books.any?

      book.borrower = borrower
      book.due_on = Date.today + days
      borrower.books << book
    end

    def return_book(book)
      current_borrower = book.borrower or raise NotOnLoanError

      current_borrower.books.delete book
      book.borrower = nil
      book.due_on = nil
    end

  end
end
