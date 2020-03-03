# ShowOff App Exercise

This is a client application that interacts with Widget, Authentication and User Management APIs.
This application makes calls to these APIs and uses its responses to enable users interaction with them. 

# Development
Application is built using Ruby on Rails 5.2.0 and Ruby version 2.4.9
Some of the essential gems used: rest-client, bootsnap, puma, pg

# Deploying Locally
Clone the repo locally from:
https://github.com/VadimZonder/showoff-app

and run:

# install gems
$ bundle install

# run the server
$ rails s

# run the rails console
$ rails c

#Development on localhost
Here is the url for the development once rails server command is ran
http://localhost:3000/

#Local Deployment Notes
may need to run '$rvm install 2.4.9' to update the ruby version

# Deploying to Heroku
$ heroku create

$ git push heroku master

$ bundle exec rake assets:precompile

$ heroku open
 

## Navigation
Make sure to register first.

***Discovered issue with Heroku described here:

https://devcenter.heroku.com/articles/cookies-and-herokuapp-com

It prevents users from using cookies so cannot use the login/out functionality. 

However, these functionalities can be use in development by using the attached rails zip files. 

No time to fix it but it would be fixed by using devise gem instead of the cookies.

# Links to view the app
# Heroku
https://showoff-final.herokuapp.com/

# For best results run on Google Chrome

#Other Important Notes
##User Management
Usually I would use devise as a user management gem. However,I decided to try to build my application without it and just relying on my own code for registering, logging in/out, resetting password, keeping a session and etc… I know that my way is not the safest way and by implementing devise would resolve these easily but I wanted to understand how sessions are created and maintained which helped me to achieve by building the app in this way.
Databases
I did not feel that there was a need to create database since we can store everything externally via the APIs provided. The only database I would create for this project would be the default database for registered users that is created with devise gem. However, I did not create it for the reasons described above.
#Testing
I used Minitest which is Rails default gem for testing.
I’ve tested the methods in welcome_controller and widget_controller.
I had a lot of JS code which I only tested with user testing and did not use any testing frameworks like selenium because of the time constraints and it was not explicitly mentioned in the specs doc.
##API Calls
I used various methods for calling the APIs, via both Ruby and JS to show my understanding and capability of using both. Again, for the rails apps I prefer to use their own gems because it is safer and easier to work with.
##RESET PASSWORD ISSUE
Reset Password API does not work
I tried accessing this API vis
1.	Postman
2.	online Curl request
3.	my rails application
This API seems to be not working.

##Improvements
This application would be improved by:
1.	Using Devise gem for user management.
2.	Using more ruby gems and less JS in views.
3.	Performing more tests especially with selenium.
4.	Few times I used CSS inside the views. I know that I need to keep css in a separate file which I did for most of my code.
5.	Similarly with JS – keeping it in a separate file is better.
6.	Used a lot of alert popup – but this is just for the demo

