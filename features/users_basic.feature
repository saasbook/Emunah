Feature: Basic users should only be able to update their own information
 
  As a member of Emunah's congregation
  So that I can keep my information updated
  I want to be update my information

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
  Then I should see "Welcome Wayne Li"

Scenario: cannot create a user
  Then I should not see "Create User"



Scenario: cannot delete a user 
  Then I should not see "Delete User"
