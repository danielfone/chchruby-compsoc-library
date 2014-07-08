require 'rails_helper'

describe Library do

  describe '#search', pending: 'HARD' do

    let(:parenting) {
      Book.new title: 'Practical Life in a Fractally Demented Universe',
               author: 'Oolon Colluphid'
    }
    let(:life) {
      Book.new title:  'Life Begins at Five Hundred and Fifty',
               author: 'Gail Andrews',
               keywords: 'practical'
    }
    let(:dictionary) {
      Book.new title:  'The Ultra-Complete Maximegalon Dictionary of Every Language Ever',
               author: 'Oolon Colluphid VI',
               keywords: 'large-print'
    }

    let(:books) { [parenting, life, dictionary] }

    it 'should match by title' do
      result = Library.search books, title: 'life'
      expect(result).to match_array [
        parenting,
        life,
      ]
    end

    it 'should match by author' do
      result = Library.search books, author: 'colluphid'
      expect(result).to match_array [
        parenting,
        dictionary,
      ]
    end

    it 'should match by keyword against any attribute' do
      result = Library.search books, keyword: 'practical'
      expect(result).to match_array [
        parenting,
        life,
      ]
    end
  end

  it 'should handle bad values' do
    expect(Library.search nil, nil).to eq []
  end

end
