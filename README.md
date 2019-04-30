# Linkly

Linkly is a url-shortening example app, built in <3 hours

## To-Do

Stuff I'd like to do next, given more time, within Part 2 of the exercise:  

* Add code validation to the controller. Error message like `FYI, linkly links should have a code like a9312bfa, you entered "foobarbazbat" which is too long`

* Re-build as a non-api app (initially generated with `rails new` using `--api` flag), so I can render an html page telling them "this short link not found"
  * for now this could be simply plain text, or I could hack html and css into place without having to regenerate app

### Install

1. Clone this repo and navigate to the project root
2. Ensure Ruby version 2.6.2 is installed and active in your terminal ([rbenv](https://github.com/rbenv/rbenv) is good for this)
3. Run command `bundle install`
4. Run command `rails db:setup`

### How to run the app

* Follow "Install" steps above.  
* Run command `rails s` (add an option ` -p 1234` to run on port 1234; default is 3000)

### How to run the test suite

* Follow "Install" steps above.
* Run command `rspec`
