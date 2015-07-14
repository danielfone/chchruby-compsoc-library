module Library
  LibraryError        = Class.new StandardError
  LimitReachedError   = Class.new LibraryError
  AlreadyOnLoanError  = Class.new LibraryError
  OverdueLoanError    = Class.new LibraryError
  NotOnLoanError      = Class.new LibraryError

  module_function

  def issue_book(book, borrower, days=21)
    raise AlreadyOnLoanError if book.on_loan?
    raise OverdueLoanError if borrower.current_overdue_count > 0

    book.borrower = borrower
    book.due_on = Time.zone.today + days
    borrower.books << book
  end

  def return_book(book)
    book.borrower.books.delete book
    book.borrower = nil
    book.due_on = nil
  end

  def search(collection, params)
    CatalogueSearch.new(collection, params).results
  end

end
