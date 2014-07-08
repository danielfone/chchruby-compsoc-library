require 'rails_helper'

feature 'Book management' do

  scenario 'Viewing existing books' do
    create :book, title: 'Confident Ruby', author: 'Avdi Grimm'
    create :book, title: 'Crafting Rails Applications', author: 'Jose Valim'

    visit '/'
    expect(page).to have_content <<-PAGE
      Title                         Author      Status    Due
      Confident Ruby                Avdi Grimm  On Shelf
      Crafting Rails Applications   Jose Valim  On Shelf
    PAGE

  end

  scenario 'Searching for a book' do
    pending 'Fix spec/lib/search_spec.rb'
    create :book, title: 'Confident Ruby', author: 'Avdi Grimm'

    visit '/'
    fill_in 'q', with: 'Con'
    click_on 'Search'
    expect(page).to have_content 'Results for "Con"'
    expect(page).to have_content 'Confident Ruby'
  end

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

  scenario 'Saving an invalid book' do
    visit '/'
    click_link 'New'
    click_button 'Create Book'
    expect(page).to have_content "Title can't be blank"
  end

  scenario 'Editing a book' do
    create :book, title: 'Confident Ruby', author: 'Avdi Grim'

    visit '/'
    click_link 'Confident Ruby'
    fill_in 'Author', with: 'Avdi Grimm'
    click_button 'Update Book'
    expect(page).to have_content 'Book saved'
    expect(page).to have_content 'Confident Ruby Avdi Grimm'
  end

  scenario 'Deleting a book' do
    pending 'EASY. Hint: this same functionailty is implemented elsewhere.'

    create :book, title: 'Confident Ruby', author: 'Avdi Grimm'

    visit '/'
    click_link 'Confident Ruby'
    click_link 'Delete Book'
    expect(page).to have_content 'Book deleted'
    expect(page).to have_content 'No books'
  end

end
