Feature: Users should be able to login and logout of their accounts
 
  As a member of Emunah's congregation
  So that I can get access to the features provided on the website
  I want to be able to login to and logout of the website

Background: I should be on the home page and logged out.
  
  Given the following users exist:
  | email                 | password | full_name   | role |
  | fake_seth@gmail.com   | abcdef   | Seth Martin | admin      |
  | wli2@berkeley.edu     | 123456   | Wayne Li    | user       |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"

Scenario: login as basic user
  When I fill in "Email" with "fake_seth@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Martin"

Scenario: login as a privileged user
  And I fill in "Email" with "fake_seth@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Martin"

Scenario: attempt to login as a user that doesn't exist yet
  When I fill in "Email" with "peter.lee@berkeley.edu"
  And I fill in "Password" with "whoami"
  And I press "Log In"
  Then I should see "Could not find peter.lee@berkeley.edu, try again."

Scenario: attempt to login as an existing user with the wrong password
  And I fill in "Email" with "fake_seth@gmail.com"
  And I fill in "Password" with "iamwrong"
  And I press "Log In"
  Then I should see "Wrong password for fake_seth@gmail.com, try again."

Scenario: maintain my login
  When I fill in "Email" with "fake_seth@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Martin"
  When I am on the home page
  Then I should see "Welcome Seth Martin"

Scenario: block dashboard if logged out
  When I am on the dashboard page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"

Scenario: logout and return to home page
  When I fill in "Email" with "fake_seth@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Martin"
  When I follow "Logout"
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"

  