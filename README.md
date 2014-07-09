Firstly, make sure you're set up and good to go. [^1]

    $ bundle
    $ bundle exec rake db:migrate db:test:prepare
    $ bundle exec rspec

The last line should read something like:

    39 examples, 0 failures, 20 pending

If you want to play around, seed the database and run the server:

    $ bundle exec rake db:seed
    $ bundle exec rails server

When you run rspec, you'll see about 20 pending specs. These are all failing, but because they're marked `pending` rspec doesn't fail the suite. Each pending spec is tagged by difficulty, although this is rather subjective.

    Book
      should require author to be set (PENDING: EASY)
      should know the borrower name (PENDING: EASY)
      when it has no due date
        should not be overdue
      when the due date is today
        should not be overdue
      when the due date has passed
        should be overdue (PENDING: EASY)
      when the due date is in the future
        should not be overdue
      #days_until_due
        should be the number of days until due date (PENDING: EASY)
      #keyword_array
        should be an array of all relevant words (PENDING: EA... MEDIUM)

You can tackle the specs in any order you like, but:

  * you probably want to fix the model specs first (`Book` then `Borrower` will be easiest)
  * if you do them in the order they're presented, the methods you fix first will be handy for the methods you fix later
  * there are a couple of feature specs that only require other failing specs fixed (these are marked as such)

Rspec helpfully provides the file and line number of the failing/pending specs. You can use this to quickly navigate there in your editor.

    Library#return_book shoud fail on an unloaned book
        # MEDIUM
        # ./spec/lib/return_book_spec.rb:17

Once you've chosen a spec to fix, remove the pending tag, run the spec again and read the error message. You might like to run the spec in focussed documentation mode, using the path and line number rspec provides:

    bundle exec rspec -fd spec/lib/return_book_spec.rb:17

Then start coding! You win when we achieve world peace. In lieu of that, a passing test suite can also be fairly satisfying.

If you really want a challenge, there are bugs in the app not covered in the test suite. >:-)

[^1]: If you're using OS X or linux, you can replace `bundle exec command` with       `bin/command` for the instructions above.
