class Borrower < ActiveRecord::Base

  has_many :books

  validates_presence_of :name

  def overdue_books
    [] # FIXME
  end

  def available_books
    Book.available
  end

  def at_limit?
    false # FIXME
  end

end
