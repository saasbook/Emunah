Feature: Basic users have a variety of actions they can take.
 
  As a member of Emunah's congregation
  So that I can get access to the features provided on the website
  I want to be able to create a basic account

Background: Rabbi (Seth) has been added as a super user of the Emunah organization
  
  Given the following users exist:
  | first name | last name | age | privilege | position  | date created | 
  | Seth       | Emunah    | 30  | Sudo      | Concierge | 17-10-2005   |
  | Wayne      | Li        | 21  | Basic     | Member    | 17-10-2017   |

  And I am on the Emunah sign up page

Scenario: create a user
  When I fill in "name" with "Wesley Wan"
  And I fill in "password" with "Emunah"
  And I press "sign_up_submit"
  Then I should see "Welcome to Emunah, Wesley Wan."


