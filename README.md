Firstly, make sure you're set up and good to go. [^1]

    $ bundle
    $ bundle exec rake db:migrate db:test:prepare
    $ bundle exec rspec

If you want to play around, seed the database and run the server:

    $ bundle exec rake db:seed
    $ bundle exec rails server

When you ran the rspec, you'll see about 20 pending specs. These are all failing, but because they're marked `pending` rspec doesn't fail the suite. Each pending spec is tagged by difficulty, although this is rather subjective.


[^1]: If you're using OS X or linux, you can replace `bundle exec command` with       `bin/command` for the instructions above.
