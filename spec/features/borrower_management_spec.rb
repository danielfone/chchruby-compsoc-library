require 'rails_helper'

feature 'Borrower management' do

  scenario 'Viewing existing borrowers' do
    create :borrower, name: 'Joe Bloggs', code: 123
    create :borrower, name: 'Jane Doe', code: 987

    visit '/'
    click_link 'Borrowers'
    expect(page).to have_content <<-PAGE
      Name            Code
      Joe Bloggs      123
      Jane Doe        987
    PAGE
  end

  scenario 'Creating a valid borrower' do
    visit '/'
    click_link 'Borrowers'
    click_link 'New'
    fill_in 'Name', with: 'Jeremy Fisher'
    click_button 'Create Borrower'
    expect(page).to have_content 'Borrower saved'
    expect(page).to have_content 'Jeremy Fisher'
  end

  scenario 'Saving an invalid borrower' do
    visit '/'
    click_link 'Borrowers'
    click_link 'New'
    click_button 'Create Borrower'
    expect(page).to have_content "Name can't be blank"
  end

  scenario 'Editing a borrower' do
    create :borrower, name: 'Janice Nemo'

    visit '/'
    click_link 'Borrowers'
    click_link 'Janice Nemo'
    fill_in 'Name', with: 'Capt. Janice Nemo'
    click_button 'Update Borrower'
    expect(page).to have_content 'Borrower saved'
    expect(page).to have_content 'Capt. Janice Nemo'
  end

  scenario 'Deleting a borrower' do
    create :borrower, name: 'James Fough'

    visit '/'
    click_link 'Borrowers'
    click_link 'James Fough'
    click_link 'Delete Borrower'
    expect(page).to have_content 'Borrower deleted'
    expect(page).not_to have_content 'James Fough'
  end

end
