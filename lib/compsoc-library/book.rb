module CompsocLibrary
  class Book
    attr_accessor :borrower
    attr_accessor :due_on

    def on_loan?
      !!borrower
    end

  end
end
