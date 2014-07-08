require 'rails_helper'

feature 'Issue books' do

  scenario 'Issue a book to a borrower' do
    create :borrower, name: 'Fred'
    create :book, title: 'The Holistic Detective Agency'

    visit borrowers_path
    click_link 'Issue'
    click_on 'Issue'
    expect(page).to have_content <<-PAGE
      Current Loans

      Book                            Due
      The Holistic Detective Agency
    PAGE
  end

end
