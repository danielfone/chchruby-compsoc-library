module CompsocLibrary
  class Borrower
    attr_accessor :books

    def books
      @books ||= []
    end

  end
end
