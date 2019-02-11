## Installation

 + Install [ruby 2.6.1](https://www.ruby-lang.org/en/news/2019/01/30/ruby-2-6-1-releashttps://www.ruby-lang.org/en/news/2019/01/30/ruby-2-6-1-releaed/)
 + Download the files here on github using a .zip, and extract the files to `C://Users/<YourUserNameHere>/Documents`
 + Open windows command line ( easiest way to do that is hit the windows key and type cmd.)
 + type `cd C://Users/<YourUserNameHere>/Documents`
 + type `gem install sinatra`
 + type `gem install csv`
 + And you're ready to run!

## Starting
  These steps need to be executed every time you'd like to run the program.

  + Open windows command line
  + Make sure you're in the directory where your project is, easiest way to check is type `dir` and it should have the files for the project in it. If not, `cd C://Users/<YourUserNameHere>/Documents`
  + type `ruby app.rb`
  + Open your browser of choice and naviagate to [localhost:4567/](http://localhost:4567/)
  + You should be up and running!

## Use
  Use should be relatively straightforward. To add a beer to the current list, click on the AB logo. It'll take you to a form to fill out.
  If you'd like to clear out the current beer list, just hit delete. This does destroy all your work though.
  When you're done, exit the preview and return to the main page to see your generated menu.
  Keep in mind, you can put whatever you'd like in the various fields, but that doesn't mean it will look right.

  Alternatively, you can use the provided csv as a template to create or edit the menu as you please. If you refresh the page, any changes to the csv
  will be reflected in the menu, but bear in mind it must be named `beer.csv` to work.

## Questions?
  Feel free to contact me with any questions at phaedra@phaedra.net.
