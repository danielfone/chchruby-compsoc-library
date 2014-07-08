class Borrower < ActiveRecord::Base

  has_many :books

  validates_presence_of :name

  before_create :generate_code

  def overdue_books
    books.select { |b| b.due_on < Date.today }
  end

  def available_books
    Book.available
  end

  def at_limit?
    limit && books.size == limit
  end

private

  def generate_code
    self.code ||= 'B' + SecureRandom.random_number(999_999).to_s
  end

end
