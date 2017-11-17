Feature: Basic users have a variety of actions they can take.
 
  As a member of Emunah's congregation
  So that I can get access to the features provided on the website
  I want to be able to create a basic account

Background: Rabbi (Seth) has been added as a super user of the Emunah organization
  
  Given the following users exist:
  | email                 | full_name     | role  | password  |
  | sethseth@gmail.com    | Seth Emunah   | admin | Emunah123 |
  | wayne.wayn@gmail.com  | Wayne Li      | user  | Emunah456 |

  And I am on the Emunah login page

# Happy Paths

Scenario: create a basic user #152061142
  When I fill in "Email" with "sethseth@gmail.com"
  And I fill in "Password" with "Emunah123"
  And I press "Log In"
  And I go to the "Create User" page
  And I fill in "Full Name" with "Wesley Wan"
  And I fill in "Email" with "wesweswes@gmail.com"
  And I fill in "Password" with "abcdef"
  And I fill in "Password" with "abcdef"
  And I select "user" from role
  And I press "Create User"
  Then I should see "Wesley Wan was successfully created"

Scenario: login as basic user, and see last log-in #152061070
  When I fill in "Email" with "wayne.wayn@gmail.com"
  And I fill in "Password" with "Emunah456"
  And I press "Log In"
  Then I should see todays date

Scenario: attempt to login as a user that doesn't exist yet #152061029
  When I fill in "Email" with "abcdef@gmail.com"
  And I fill in "Password" with "whoami"
  And I press "Log In"
  Then I should see "Could not find abcdef@gmail.com"



