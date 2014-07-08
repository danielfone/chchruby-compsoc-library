require 'rails_helper'

describe Library do

  describe '#search', pending: 'HARD' do

    let(:four_rules) { Book.new title: '4 Rules of Simple Design', author: 'Corey Haines', keywords: 'programming' }
    let(:computer_programming) { Book.new title: 'The Art of Computer Programming', author: 'Donald Knuth' }
    let(:art_of_zen) { Book.new title: 'Zen and the Art of Motorcycle Maintenance', author: 'Corey Someone' }

    let(:books) {
      [
        computer_programming,
        art_of_zen,
        four_rules,
      ]
    }

    it 'should match by title' do
      result = Library.search books, title: 'art'
      expect(result).to match_array [
        computer_programming,
        art_of_zen,
      ]
    end

    it 'should match by author' do
      result = Library.search books, author: 'corey'
      expect(result).to match_array [
        four_rules,
        art_of_zen,
      ]
    end

    it 'should match by keyword against any attribute' do
      result = Library.search books, keyword: 'programming'
      expect(result).to match_array [
        four_rules,
        computer_programming,
      ]
    end
  end

  it 'should handle bad values' do
    expect(Library.search nil, nil).to eq []
  end

end
