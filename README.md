## 1. Install & Set Up Ruby

This application has been tested on:

  * OS X / Ruby 2.2.2 (installed via RVM)
  * Windows 8 / Ruby 2.1.5 (installed via [RailsInstaller](http://railsinstaller.org/en))

It's highly recommended you use either RVM or RailsInstaller to install Ruby and ensure your system has the needed dependencies.<sup>[1](#one)</sup> Once you've installed Ruby, run the following:

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

Once the Ruby installation is verified and up to date as per the section above, we can get our demo application set up and ready to go. <sup>[2](#two)</sup> The syntax of these commands may need to be adjusted for Windows users.

    $ git clone https://github.com/danielfone/chchruby-compsoc-library.git
    $ cd chchruby-compsoc-library
    $ bundle
    $ rake db:setup
    $ rspec

The last line should read something like:

    39 examples, 0 failures, 20 pending

Now run the web server.

    $ rails server

Now you can visit `http://localhost:3000` in your browser and you should see a list of books appear.

## 3. Taking the Challenge

Firstly, you need run the application and understand what it does. If you haven't already, start the server:

    $ rails server

Open your browser and visit `http://localhost:3000`. You should see a list of books appear. Your first tasks are:

  * Add a book to the library
  * Search for the new book (hmmm, something appears to be broken here!?)
  * Add yourself as a borrower
  * Check your new book out to yourself.
  * Fix the annoying grey box around the forms.

Once you've played around, it's time to fix the application. While you can tackle the specs in anyway you like, there is a suggested order below. For each spec, open the file and set `is_pending = false`. Then run the spec like so:

    rspec spec/models/book_spec.rb --fail-fast

You should see a single error. Make some changes, then run the command again. Once you've fixed the problem, rspec will run until the next failing example. Rinse and repeat until every example in the file is passing, then move on to the next file. The recommended order is:

    rspec spec/models/book_spec.rb --fail-fast
    rspec spec/models/borrower_spec.rb --fail-fast
    rspec spec/lib/return_book_spec.rb --fail-fast [med]
    rspec spec/lib/search_spec.rb --fail-fast [med]
    rspec spec/lib/issue_book_spec.rb --fail-fast [model/borrower]
    rspec spec/features/borrower_management_spec.rb --fail-fast
    rspec spec/features/book_management_spec.rb --fail-fast [lib/search]
    rspec spec/features/loan_management_spec.rb --fail-fast [lib/issue_book]

You win when we achieve world peace. Failing that, a passing test suite can also be fairly satisfying.

---

1: <a name="one"></a> Unless you know your system has the necessary dependencies for compiling the native nokogiri gem on your platform.

2: <a name="two"></a> If you're using OS X or linux, you can replace `bundle exec command` with `bin/command` for the instructions above.
