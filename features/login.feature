Feature: Users should be able to login and logout of their accounts
 
  As a member of Emunah's congregation
  So that I can get access to the features provided on the website
  I want to be able to login to and logout of the website

Background: I should be on the home page and logged out.
  
  Given the following users exist:
  | email                 | password | full_name   | is_admin |
  | fake_seth@gmail.com   | 123456   | Seth Martin | Yes      |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"

Scenario: login as basic user, and see last log-in
  When I fill in "Email" with "fake_seth@gmail.com"
  And I fill in "Password" with "123456"
  And I press "Log In"
  Then I should see "Welcome Seth Martin!"

Scenario: attempt to login as a user that doesn't exist yet
  When I fill in "Email" with "peter.lee@berkeley.edu"
  And I fill in "Password" with "whoami"
  And I press "Log In"
  Then I should see "Could not find peter.lee@berkeley.edu, try again."

Scenario: login and create a basic user
  When I fill in "Email" with "fake_seth@gmail.com"
  And I fill in "Password" with "123456"
  And I press "Log In"
  Then I should see "Welcome Seth Martin!"
  When I go to the "Create User" page
  And I fill in "Email" with "wesley.wan@eberkeley.edu"
  And I fill in "Password" with "helloworld"
  And I fill in "Full Name" with "Wesley Wan"
  And I select "No" from "Is Admin"
  And I press "Create User"
  Then I should see "Wesley Wan was successfully created."
