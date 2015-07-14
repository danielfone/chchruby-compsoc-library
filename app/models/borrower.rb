# == Schema Information
#
# Table name: borrowers
#
#  id    :integer          not null, primary key
#  name  :string
#  code  :string
#  limit :integer
#

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
    current_loan_count >= limit if limit
  end

  def current_loan_count
    books.size
  end

  def current_overdue_count
    0 #FIXME
  end

end
