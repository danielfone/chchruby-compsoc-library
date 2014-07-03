require 'rails_helper'

feature 'Book creation' do
  scenario 'Creating a valid book' do
    visit '/'
    click_link 'New Book'
    fill_in 'Title', with: 'The Art of Computer Programming'
    fill_in 'Author', with: 'Donald Knuth'
    click_button 'Save'
    expect(page).to have_content 'Book saved'
    expect(page).to have_content 'Title The Art of Computer Programming'
    expect(page).to have_content 'Author Donald Knuth'
  end
end
