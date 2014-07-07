class Borrower < ActiveRecord::Base

  validates_presence_of :name

  before_create :generate_code

private

  def generate_code
    self.code ||= 'B' + SecureRandom.random_number(999_999).to_s
  end

end
