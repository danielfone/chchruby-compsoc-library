require 'rails_helper'

describe Book do
  subject(:book) { described_class.new }

  it 'should know the borrower name' do
    pending 'EASY'
    expect(book.borrower_name).to be_nil
    book.borrower = Borrower.new name: 'Malcolm Reynolds'
    expect(book.borrower_name).to eq 'Malcolm Reynolds'
  end
end
