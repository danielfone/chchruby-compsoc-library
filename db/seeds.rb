names = [
  'Malcolm Reynolds',
  'Zoe Washburne',
  'Hoban Washburne',
  'Inara Serra',
  'Jayne Cobb',
  'Kaylee Frye',
  'Simon Tam',
  'River Tam',
]

Borrower.create! names.map { |n| {name: n} }

Book.create! title:  'Practical Life in a Fractally Demented Universe',
             author: 'Oolon Colluphid'

Book.create! title:  'Life Begins at Five Hundred and Fifty',
             author: 'Gail Andrews'

Book.create! title:  'The Ultra-Complete Maximegalon Dictionary of Every Language Ever',
             author: 'Oolon Colluphid VI'

Book.create! title:  'Celestial Homecare Omnibus',
             author: 'Eccentrica Gallumbits'

Book.create! title:  'Encyclopedia Galactica',
             author: 'Obtorto Collo'

Book.create! title:  'Fifty-Three More Things to do in Zero Gravity',
             author: 'Dr. Dan Streetmentioner'

Book.create! title:  'Songs of the Long Land',
             author: 'Lallafa'
