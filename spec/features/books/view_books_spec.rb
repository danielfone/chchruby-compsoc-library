require 'rails_helper'

feature 'Viewing books' do
  scenario 'Viewing existing books' do
    create :book, title: 'Confident Ruby', author: 'Avdi Grimm'
    create :book, title: 'Crafting Rails Applications', author: 'Jose Valim'

    visit '/'
    expect(page).to have_content <<-PAGE
      Author            Title
      Avdi Grimm        Confident Ruby
      Jose Valim        Crafting Rails Applications
    PAGE

  end
end
