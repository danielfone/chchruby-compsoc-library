require 'rails_helper'

describe Borrower do
  subject(:borrower) { described_class.new }

  it 'should automatically generate a code if none is provided' do
    borrower = build :borrower
    expect(borrower.code).to be_nil
    borrower.save!
    expect(borrower.code).to match /\w{5}/
  end
end
