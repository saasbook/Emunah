Feature: Admin can create, update, and delete users.
 
  As an admin member of Emunah's congregation
  So that I can grow the membership of my organization
  I want to be able to create, update, and delete new users

Background: Seth, an admin, has logged in
  
  Given the following users exist:
  | email                 | password | full_name   | is_admin |
  | seth.martin@gmail.com | abcdef   | Seth Martin | Yes      |
  | wli2@berkeley.edu     | 123456   | Wayne Li    | No       |

Scenario: login as a privileged user
  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  And I fill in "Email" with "seth.martin@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Martin"

Scenario: attempt to login as an existing user with the wrong password
  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  And I fill in "Email" with "seth.martin@gmail.com"
  And I fill in "Password" with "iamwrong"
  And I press "Log In"
  Then I should see "Wrong password for seth.martin@gmail.com, try again."

Scenario: login as a basic user
  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  And I fill in "Email" with "wli2@berkeley.edu"
  And I fill in "Password" with "123456"
  And I press "Log In"
  Then I should see "Welcome Wayne Li"

Scenario: create a basic user
  When I go to the "Create User" page
  And I fill in "Email" with "wesley.wan@berkeley.edu"
  And I fill in "Password" with "helloworld"
  And I fill in "Full Name" with "Wesley Wan"
  And I select "No" from "Is Admin"
  And I press "Create User"
  Then I should see "Wesley Wan was successfully created."

Scenario: try to create a basic user that already exists
  When I go to the "Create User" page
  And I fill in "Email" with "wli2@berkeley.edu"
  And I fill in "Password" with "qwerty"
  And I fill in "Full Name" with "Fake Wayne Li"
  And I select "No" from "Is Admin"
  And I press "Create User"
  Then I should see "Could not create user. Email has already been taken."

Scenario: try create a user with no fields filled out
  When I go to the "Create User" page
  And I press "Create User"
  Then I should see "Could not create user. Full name can't be blank, Full name is too short (minimum is 3 characters), Email can't be blank, Email is invalid, Password is too short (minimum is 6 characters)."

Scenario: update a user
  When I go to the "Edit User" page
  And I fill in "Email" with "wli2@berkeley.edu"
  Then I should see "Information for Wayne Li"
  When I fill in "Email" with "wayne.li@gmail.com"
  And I press "Finish Editing"
  Then I should see "Wayne Li's information has been updated."
  When I go to the "Edit User" page
  And I fill in "Email" with "wayne.li@gmail.com"
  Then I should see "Information for Wayne Li"

Scenario: delete a user 
  When I go to the "Delete User" page
  And I fill in "Email" with "wli2@berkeley.edu"
  And I press "Delete"
  Then I should see "Wayne Li has been removed."
  
Scenario: try to delete a user that doesn't exist
  When I go to the "Delete User" page
  And I fill in "Email" with "random@berkeley.edu"
  And I press "Delete"
  Then I should see "This user doesn't exist!"
