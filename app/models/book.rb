# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string
#  author      :string
#  borrower_id :integer
#  due_on      :date
#  keywords    :string
#

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
    # FIXME
  end

  def overdue?
    false # FIXME
  end

  def days_until_due
    0 # FIXME
  end

  def keyword_array
    [] #FIXME
  end

end
