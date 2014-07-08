class Book < ActiveRecord::Base

  scope :available, -> { where borrower_id: nil }

  belongs_to :borrower

  validates_presence_of :title, :author

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

  def borrower_name
    borrower.name
  end

end
