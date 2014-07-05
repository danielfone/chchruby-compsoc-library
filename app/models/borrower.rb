class Borrower < ActiveRecord::Base

  validates_presence_of :name

  before_create :generate_code

  private

  def generate_code
    self.code ||= SecureRandom.hex 10
  end

end
