require 'rails_helper'

feature 'Loan management' do
  is_pending = false

  let!(:book) { create :book, title: "Time Traveller's Handbook of 1001 Tense Formations" }
  let!(:borrower) { create :borrower, name: "Malcolm Reynolds" }

  scenario 'Issue a book to a borrower' do
    visit borrowers_path
    click_link 'Issue'
    click_on 'Issue'
    expect(page).to have_content <<-PAGE
      Current Loans

      Book                            Due
      Time Traveller's Handbook
    PAGE
  end

  scenario 'Issue book beyond a borrowers limit', pending: is_pending do
    # Harder. Do spec/lib/issue_book_spec.rb first
    create :book, title: 'How I Survived an Hour with a Sprained Finger', borrower: borrower
    borrower.update_attributes limit: 1

    visit borrowers_path
    click_link 'Issue'
    click_on 'Issue'
    expect(page).to have_content "Borrower has reached limit"
  end

  scenario 'Return a book via book list' do
    borrower.books << book

    visit books_path
    click_on 'Return'
    expect(page).not_to have_link 'Return'
  end

  scenario 'Return a book via borrower' do
    borrower.books << book

    visit loans_borrower_path(borrower)
    click_on 'Return'
    expect(page).not_to have_link 'Return'
  end


end
