
# TechTime
This is a hand-rolled web application created by Emily Wise, Marshall Houston, and Lauren Billington as students at Turing School of Software and Design. TechTime is a Ruby on Rails application using Ruby 2.4.1, Rails 5 with Active Record, PostGreSQL database, Heroku platform, and AWS.

The implementation was based on user stories for Categories, Items, and Users.
To see the project guidelines, please visit http://backend.turing.io/module2/projects/little_shop
www.turing.io

To view a live version of this application, please go to:
https://git.heroku.com/techtime-emilywise.git

## Interacting with the live version of TechTime.
All users are able to view Categories, Freelancers, and add Freelancer Hours to a cart. Unauthenticated users can create an account.

Authenticated users are able to place an order for Freelancer Hours, as well as view their own orders. (Payment processing was not required for this project).
Users have been seeded to the database. You can login to see other users' data by using the username and passwords in the seed files. Here's one set of credentials to try.
username:Janet456
password: password

Authenticated admins are able to create and edit Freelancer profiles, view and edit past Orders. Admins do not have the ability to create categories or to create additional admins. There is one Admin account.  
username: admin
password: password

For more about specific functionality, please review the testing suite.

## Implementing TechTime
TechTime is a Ruby on Rails application using Ruby 2.4.1, Rails 5, PostGreSQL database, Heroku platform, and AWS. Please visit the Gemfile for more information on other gems used to make this project fantastic.

To experience TechTime, please start by forking and cloning this repo.
Make sure to bundle, then create and seed your local database.  Note that this master version is set up to use Heroku and may not render properly on your localhost due to changes made to the asset pipeline.

## Testing TechTime
This application was developed using Test Driven Development. Make sure that you have the gems for RSpec, Capybara, and Factory Bot (formerly Factory Girl) in order to run this test suite.
