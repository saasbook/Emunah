Feature: Admin can create, update, and delete users.
 
  As an admin member of Emunah's congregation
  So that I can grow the membership of my organization
  I want to be able to create, update, and delete new users

Background: Seth, an admin, has logged in
  
  Given the following users exist:
  | email                 | password | full_name   | role |
  | seth.martin@gmail.com | abcdef   | Seth Martin | admin      |
  | wayne.li@gmail.com    | abcdef   | Wayne Li    | user       |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  When I fill in "Email" with "seth.martin@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Martin"

Scenario: create a basic user #152941241
  When I go to the "Create User" page
  And I fill in "Email" with "wesley.wan@berkeley.edu"
  And I fill in "Password" with "helloworld"
  And I fill in "Full Name" with "Wesley Wan"
  And I select "user" from "role"
  And I press "Create User"
  Then I should see "Wesley Wan was successfully created."

Scenario: try to create a basic user that already exists #152941308
  When I go to the "Create User" page
  And I fill in "Email" with "seth.martin@gmail.com"
  And I fill in "Password" with "qwerty"
  And I fill in "Full Name" with "Fake Seth Martin"
  And I select "admin" from "role"
  And I press "Create User"
  Then I should see "Could not create user. Email has already been taken."

Scenario: try create a user with no fields filled out #152941423
  When I go to the "Create User" page
  And I press "Create User"
  Then I should see "Could not create user. Full name can't be blank, Full name is too short (minimum is 3 characters), Email can't be blank, Email is invalid, Password is too short (minimum is 6 characters)."

Scenario: update a user #152941458
  When I go to the edit user page for "wayne.li@gmail.com"
  Then I should see "Edit User: Wayne Li"
  When I fill in "Email" with "new_wayne.li@gmail.com"
  And I press "Update User"
  Then I should see "Wayne Li was successfully updated."
