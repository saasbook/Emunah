Feature: Basic users have a variety of actions they can take.
 
  As a member of Emunah's congregation
  So that I can get access to the features provided on the website
  I want to be able to create a basic account

Background: Rabbi (Seth) has been added as a super user of the Emunah organization
  
  Given the following users exist:
  | first name | last name | age | privilege | position  | last login      | password (hashed) |
  | Seth       | Emunah    | 30  | Sudo      | Concierge | 17-10-2017:1830 | Emunah123         |
  | Wayne      | Li        | 21  | Basic     | Member    | 13-10-2017:1420 | Emunah456         |

  And I am on the Emunah login page

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

Scenario: attempt to login as a user that doesn't exist yet
  When I fill in "name" with "Peter Lee"
  And I fill in "password" with "whoami"
  And I press "log_in_submit"
  Then I should see "User does not exist."

Scenario: filter catergories in database
  When I fill in "category" with "children"
  And I fill in "family name" with Emunah
  And I press "filter_by_family_name"
  Then I should see "Children: Emunah(Gale, Sarah, George)"

Scenario: protect confidential information from other users
  When I fill in "information" with "confidential"
  And I press "set_as_confidential"
  Then I should see "Information is protected and confidential to other users."

Scenario: search items in database by date
  When I fill in "name" with "Seth"
  And I fill in "date" with "17-10-2004"
  And I fill category with "names"
  And I press "search_category_by_date"
  Then I should see "Name(Seth)"
