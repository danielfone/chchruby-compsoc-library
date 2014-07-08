class Borrower < ActiveRecord::Base

  has_many :books

  validates_presence_of :name

  def overdue_books
    []
  end

  def available_books
    Book.available
  end

  def at_limit?

  end

end
