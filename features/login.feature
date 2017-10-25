Feature: Users should be able to login and logout of their accounts
 
  As a member of Emunah's congregation
  So that I can get access to the features provided on the website
  I want to be able to login to and logout of the website

Background: I should be on the home page and logged out.
  
  Given the following users exist:
  | email                 | password | full_name   | status |
  | fake_seth@gmail.com   | 123456   | Seth Martin | True   |
  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"

Scenario: login as basic user, and see last log-in
  When I fill in "Email" with "fake_seth@gmail.com"
  And I fill in "Password" with "123456"
  And I press "Log In"
  Then I should see "Welcome back to Emunah, Wayne."

Scenario: attempt to login as a user that doesn't exist yet
  When I fill in "Email" with "peter.lee@berkeley.com"
  And I fill in "Password" with "whoami"
  And I press "Log In"
  Then I should see "User does not exist."

Scenario: login and create a basic user
  When I fill in "Email" with "seth.martin@gmail.com"
  And I fill in "Password" with "abcde"
  And I press "Log In"
  Then I should see "Welcome back to Emunah, Seth."
  When I press "Create User"
  And I fill in "Email" with "wesley.wan"
  And I fill in "Password" with "helloworld"
  And I fill in "Full Name" with "Wesley Wan"
  And I fill in "Status" with "False"
  And I press "Create User"
  Then I should see "Wesley Wan was successfully created."
