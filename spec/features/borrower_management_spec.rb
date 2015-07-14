require 'rails_helper'

feature 'Borrower management' do
  is_pending = false

  scenario 'Viewing existing borrowers' do
    create :borrower, name: 'River Tam', code: 123
    create :borrower, name: 'Simon Tam', code: 987

    visit '/'
    click_link 'Borrowers'
    expect(page).to have_content <<-PAGE
      Name        Code  On Loan   Overdue
      River Tam   123   0         0       Issue Books
      Simon Tam   987   0         0       Issue Books
    PAGE
  end

  scenario 'Creating a valid borrower' do
    visit '/'
    click_link 'Borrowers'
    click_link 'New'
    fill_in 'Name', with: 'Jayne Cobb'
    click_button 'Create Borrower'
    expect(page).to have_content 'Borrower saved'
    expect(page).to have_content 'Jayne Cobb'
  end

  # Try this in the browser first
  scenario 'Saving an invalid borrower', pending: is_pending do
    # Crib this from elsewhere
    visit '/'
    click_link 'Borrowers'
    click_link 'New'
    click_button 'Create Borrower'
    expect(page).to have_content "Name can't be blank"
  end

  scenario 'Editing a borrower' do
    create :borrower, name: 'Zoe Alleyne'

    visit '/'
    click_link 'Borrowers'
    click_link 'Zoe Alleyne'
    fill_in 'Name', with: 'Zoe Washburne'
    click_button 'Update Borrower'
    expect(page).to have_content 'Borrower saved'
    expect(page).to have_content 'Zoe Washburne'
  end

  scenario 'Deleting a borrower' do
    create :borrower, name: 'Hoban Washburne'

    visit '/'
    click_link 'Borrowers'
    click_link 'Hoban Washburne'
    click_link 'Delete Borrower'
    expect(page).to have_content 'Borrower deleted'
    expect(page).not_to have_content 'Hoban Washburne'
    # I am a leaf on the wind...
  end

end
