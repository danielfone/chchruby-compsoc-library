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

Once the Ruby installation is verified and up to date as per the section above, we can get our demo application set up and ready to go.<sup>[2](#two)</sup> The syntax of these commands may need to be adjusted for Windows users.

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

Once you've played around, it's time to fix the application. For each spec, open the file, set `is_pending = false`, then run the spec like so:

    rspec --fail-fast spec/models/book_spec.rb

You should see a single error. Make some changes, then run the command again.<sup>[3](#three)</sup> Once you've fixed the problem, rspec will run until the next failing example. Rinse and repeat until every example in the file is passing, then move on to the next file. Most of the specs don't depend on each other, so feel free to move on if you get stuck. If you get really stuck, example solutions can be found on the [solutions branch](https://github.com/danielfone/chchruby-compsoc-library/commits/solutions). While you _can_ tackle the specs in any order you like, it might be easiest to approach it as follows:

    rspec --fail-fast spec/models/book_spec.rb
    rspec --fail-fast spec/models/borrower_spec.rb
    rspec --fail-fast spec/lib/issue_book_spec.rb
    rspec --fail-fast spec/lib/return_book_spec.rb
    rspec --fail-fast spec/features/borrower_management_spec.rb
    rspec --fail-fast spec/features/loan_management_spec.rb
    rspec --fail-fast spec/lib/search_spec.rb
    rspec --fail-fast spec/features/book_management_spec.rb

You win when we achieve world peace. Failing that, a passing test suite can also be fairly satisfying. When you think you've completed everything, run `rspec` again and ensure the suite is green.

    $ rspec
    .......................................

    Finished in 0.86335 seconds (files took 2.49 seconds to load)
    39 examples, 0 failures


---

1: <a name="one"></a> Unless you know your system has the necessary dependencies for compiling the native nokogiri gem on your platform.

2: <a name="two"></a> If you're using OS X or linux, you can replace `bundle exec command` with `bin/command` for the instructions above.

3: <a name="three"></a> You can also use the rerun gem. This automatically reruns a command whenever your files change.

    $ gem install rerun
    $ rerun -- rspec --fail-fast spec/models/book_spec.rb
