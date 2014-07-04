module CompsocLibrary
  class Borrower
    attr_accessor :books
    attr_accessor :limit

    def books
      @books ||= []
    end

    def at_limit?
      limit && books.size == limit
    end

    def overdue_books
      books.select { |b| b.due_on < Date.today }
    end

  end
end
