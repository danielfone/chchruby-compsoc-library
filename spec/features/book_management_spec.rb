require 'rails_helper'

feature 'Book management' do

  is_pending = true

  before do
    create :book, title: 'Celestial Homecare Omnibus', author: 'Eccentrica Gallumbits'
    create :book, title: 'Encyclopedia Galactica', author: 'Obtorto Collo'
  end

  scenario 'Viewing existing books' do
    visit '/'
    expect(page).to have_content <<-PAGE
      Title                         Author                 Status    Due
      Celestial Homecare Omnibus    Eccentrica Gallumbits  On Shelf
      Encyclopedia Galactica        Obtorto Collo          On Shelf
    PAGE

  end

  scenario 'Searching for a book', pending: is_pending do
    # Fix spec/lib/search_spec.rb first

    visit '/'
    fill_in 'q', with: 'Obtorto'
    click_on 'Search'
    expect(page).to have_content 'Results for "Obtorto"'
    expect(page).to have_content 'Encyclopedia Galactica'
  end

  scenario 'Creating a valid book' do
    visit '/'
    click_link 'New'
    fill_in 'Title', with: 'Fifty-Three More Things to do in Zero Gravity'
    fill_in 'Author', with: 'Dr. Dan Streetmentioner'
    click_button 'Create Book'
    expect(page).to have_content 'Book saved'
    expect(page).to have_content 'Fifty-Three More Things to do in Zero Gravity'
    expect(page).to have_content 'Dr. Dan Streetmentioner'
  end

  scenario 'Saving an invalid book' do
    visit '/'
    click_link 'New'
    click_button 'Create Book'
    expect(page).to have_content "Title can't be blank"
  end

  scenario 'Editing a book' do
    visit '/'
    click_link 'Encyclopedia Galactica'
    fill_in 'Author', with: 'Omnes homines'
    click_button 'Update Book'
    expect(page).to have_content 'Book saved'
    expect(page).to have_content 'Encyclopedia Galactica Omnes homines'
  end

  scenario 'Deleting a book', pending: is_pending do
    # Hint: this same functionailty is implemented elsewhere.'

    visit '/'
    click_link 'Encyclopedia Galactica'
    click_link 'Delete Book'
    expect(page).to have_content 'Book deleted'
  end

end
