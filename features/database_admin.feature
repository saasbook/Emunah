Feature: Admin can operate on the database
 
  As an admin member of Emunah's congregation
  So that I can get information about my organization members
  I want to be able to perform search operations on my database

Background: Seth, an admin, has logged in
  
  Given the following users exist:
  | email                 | password | full_name   | is_admin |
  | seth.martin@gmail.com | abcdef   | Seth Martin | Yes      |
  | wli2@berkeley.edu     | 123456   | Wayne Li    | No       |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  And I fill in "Email" with "seth.martin@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Martin!"
  And I go to the "Database" page
  Then I should see "Database"

Scenario: get a table of users with all their information
  When I press "Get All Users"
  Then I should see "Seth Martin"
  Then I should see "abcdef"
  Then I should see "seth.martin@gmail.com"
  Then I should see "Wayne Li"
  Then I should see "123456"
  Then I should see "wli2@berkeley.edu"
