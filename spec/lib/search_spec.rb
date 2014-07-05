require 'compsoc-library/catalogue'
require 'compsoc-library/book'

module CompsocLibrary
  describe Catalogue do

    describe '#search' do

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
        result = Catalogue.search books, title: 'art'
        expect(result).to match_array [
          computer_programming,
          art_of_zen,
        ]
      end

      it 'should match by author' do
        result = Catalogue.search books, author: 'corey'
        expect(result).to match_array [
          four_rules,
          art_of_zen,
        ]
      end

      it 'should match by keyword against any attribute' do
        result = Catalogue.search books, keyword: 'programming'
        expect(result).to match_array [
          four_rules,
          computer_programming,
        ]
      end

      it 'should suggest alternatives'

      it 'should handle bad values' do
        expect(Catalogue.search nil, nil).to eq []
      end
    end

  end
end
