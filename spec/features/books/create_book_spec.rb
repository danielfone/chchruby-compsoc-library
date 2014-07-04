require 'rails_helper'

feature 'Book creation' do
  scenario 'Creating a valid book' do
    visit '/'
    click_link 'New'
    fill_in 'Title', with: 'The Art of Computer Programming'
    fill_in 'Author', with: 'Donald Knuth'
    click_button 'Create Book'
    expect(page).to have_content 'Book saved'
    expect(page).to have_content 'The Art of Computer Programming'
    expect(page).to have_content 'Donald Knuth'
  end
end
