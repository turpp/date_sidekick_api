# README

This is a backend API for Date Sidekick. The React Front end can be found at https://github.com/turpp/dateSidekick. IMPORTANT: to run in development make sure that rails is running at http://localhost:3000 and the front-end is running at http://localhost:3001. This api is setup to store users dates and information on the places they have gone. To get infomration from Yelp-fusion API this backend will make a request and relay that to the front-end. No information from the query is saved. 



* Ruby version
ruby '2.6.1'
* System dependencies
gem 'yelp-fusion'
gem 'fast_jsonapi'
gem 'dotenv-rails'
* Configuration
must run bundle install to make sure you have required gems
must have postgreSQL for the database
* How to run the test suite
No test at this time

