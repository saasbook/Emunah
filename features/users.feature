Feature: Basic users have a variety of actions they can take.
 
  As a member of Emunah's congregation
  So that I can get access to the features provided on the website
  I want to be able to create a basic account

Background: Rabbi (Seth) has been added as a super user of the Emunah organization
  
  Given the following users exist:
  | username | password | full name   | status |
  | seth     | abcde    | Seth Emunah | True   |
  | wayne    | 12345    | Wayne Li    | False  |

  And I am on my own dashboard

# Happy Paths

Scenario: create a basic user
  When I follow "Create User"
  And I fill in "name" with "Wesley Wan"
  And I fill in "password" with "Emunah789"
  And I press "sign_up_submit"
  Then I should see "Welcome to Emunah, Wesley."

Scenario: login as basic user, and see last log-in
  When I fill in "name" with "Wayne Li"
  And I fill in "password" with "Emunah456"
  And I press "log_in_submit"
  Then I should see "Welcome back to Emunah, Wayne. You last visited on October 13, 2017 at 2:20 PM."

# Sad Paths

Scenario: attempt to login as a user that doesn't exist yet
  When I fill in "name" with "Peter Lee"
  And I fill in "password" with "whoami"
  And I press "log_in_submit"
  Then I should see "User does not exist."
