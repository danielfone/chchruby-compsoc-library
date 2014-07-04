require 'compsoc-library/book'
require 'compsoc-library/borrower'

module CompsocLibrary
  module Library
    module_function

    def lend(book, borrower, length)
      book.borrower = borrower
      book.due_on = length.from_now.to_date
      borrower.books << book
    end
  end
end
