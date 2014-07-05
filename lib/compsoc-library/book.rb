require 'ostruct'

module CompsocLibrary
  class Book
    attr_accessor :borrower
    attr_accessor :due_on
    attr_accessor :title
    attr_accessor :author
    attr_accessor :keywords

    def initialize(attrs={})
      attrs.each { |attr,value| send "#{attr}=", value }
    end

    def on_loan?
      # !! is a ruby idiom that converts a 'truthy' value to true.
      # It simply applies the negation operator (!) twice.
      #
      # In this case, borrower can either be a Borrower object or nil
      # If borrower is set:
      #   !!borrower => !(!#<Borrower>) => !(false) => true
      #   !!borrower => !(!nil)         => !(true)  => false
      !!borrower
    end

  end
end
