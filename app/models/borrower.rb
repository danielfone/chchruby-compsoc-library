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

  def current_loan_count
    0 #FIXME
  end

  def current_overdue_count
    0 #FIXME
  end

end
