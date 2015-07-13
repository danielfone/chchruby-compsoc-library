## 1. Install & Set Up Ruby

This application has been tested on:

  * OS X / Ruby 2.2.2 (installed via RVM)
  * Windows 8 / Ruby 2.1.5 (installed via [RailsInstaller](http://railsinstaller.org/en))

It's highly recommended you use either RVM or RailsInstaller to install Ruby and ensure your system has the needed dependencies.<sup>1</sup> Once you've installed Ruby, run the following:

    $ ruby -v               # You should see the ruby version
    $ gem update --system
    $ gem update bundler

If the `gem update` command fails with a message about SSL, you may need to switch to an insecure gem source temporarily:

    $ gem sources -r https://rubygems.org/  # Temporarily remove secure connection
    $ gem sources -a http://rubygems.org/   # Add insecure connection
    $ gem update --system                   # Now we're able to update rubygems without SSL
    $ gem sources -r http://rubygems.org/   # Remove insecure connection
    $ gem sources -a https://rubygems.org/
    $ gem update bundler

## 2. Setup The Application

Once the Ruby installation is verified and up to date as per the section above, we can get our demo application set up and ready to go. <sup>2</sup> The syntax of these commands may need to be adjusted for Windows users.

    $ git clone https://github.com/danielfone/chchruby-compsoc-library.git
    $ cd chchruby-compsoc-library
    $ bundle
    $ bundle exec rake db:setup
    $ bundle exec rspec

The last line should read something like:

    39 examples, 0 failures, 20 pending

Now run the web server.

    $ bundle exec rails server

Now you can visit `http://localhost:3000` in your browser and you should see a list of books appear.

## 3. Taking the Challenge

Firstly, you need run the application and understand what it does.

    $ bundle exec rails server

Open your browser and visit `http://localhost:3000`. You should see a list of books appear. Your first tasks are:

  * Add a book to the library
  * Search for the new book (hmmm, something appears to be broken here!?)
  * Add yourself as a borrower
  * Check your new book out to yourself.

Once you've played around, it's time to fix the application. When you run rspec, you'll see about 20 pending specs. These are all failing, but because they're marked `pending` rspec doesn't fail the suite. Each pending spec is tagged by difficulty, although this is rather subjective.

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

1: Unless you know your system has the necessary dependencies for compiling the native nokogiri gem on your platform.
2: If you're using OS X or linux, you can replace `bundle exec command` with `bin/command` for the instructions above.
