Feature: Basic users are limited on their database operation
 
  As an admin member of Emunah's congregation
  So that I can protect everyone's information
  I want to limit the information that basic users can access

Background: Wayne Li, a basic user, has logged in
  
  Given the following users exist:
  | email                 | password | full_name   | is_admin |
  | seth.martin@gmail.com | abcdef   | Seth Martin | Yes      |
  | wli2@berkeley.edu     | 123456   | Wayne Li    | No       |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  And I fill in "Email" with "wli2@berkeley.edu"
  And I fill in "Password" with "123456"
  And I press "Log In"
  Then I should see "Welcome Wayne Li!"

Scenario: should not be able to get a table of users with all their information
  Then I should not see "Get All Users"
