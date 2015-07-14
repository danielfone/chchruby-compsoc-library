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

  after_save :generate_code, unless: :code?

  def overdue_books
    books.select &:overdue?
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
    overdue_books.size
  end

private

  # There are a lot of ways to do this.
  # This is a method that might be useful in a realistic context
  # It uses the record's id to generate the code, so there'll never be a conflict
  # This has to happen in a separate query after the save, since we don't have the id before then
  def generate_code
    update_attributes code: ["B%05d" % id]
  end

end
