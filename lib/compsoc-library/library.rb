require 'active_support/core_ext'
require 'compsoc-library/book'
require 'compsoc-library/borrower'

module CompsocLibrary
  class LibraryError < StandardError; end
  class LimitReachedError < LibraryError; end
  class AlreadyOnLoanError < LibraryError; end
  class OverdueLoanError < LibraryError; end

  module Library
    module_function

    def issue_book(book, borrower, loan_length=3.weeks)
      raise LimitReachedError if borrower.at_limit?
      raise AlreadyOnLoanError if book.on_loan?
      raise OverdueLoanError if borrower.overdue_books.any?

      book.borrower = borrower
      book.due_on = loan_length.from_now.to_date
      borrower.books << book
    end
  end
end
