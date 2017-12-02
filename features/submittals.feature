Feature: Users (Basic or Admin) can create, update, and delete submittals.
 
  As an member of Emunah's congregation
  So that I can contribute to the membership of my organization
  I want to be able to create, update, and delete new submittals 

Background: Seth, an admin, has logged in
  
  Given the following users exist:
  | email                 | password | full_name   | role |
  | Seth.li@gmail.com    | abcdef   | Seth Li    | user     |

  Given the following families exist:
  | family_name    |
  | fam0           |

  Given the following submittal exist:
  | family_id | title            | notes   | access_level          | user_id |
  |    0      | Random_Title     | None    | Financially Sensitive |    0    |
  |    0      | Random_Title 2   | sigh    | Very Confidential     |    0    |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  When I fill in "Email" with "Seth.li@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Li"

Scenario: create a submittal #152061029
  When I am on the show family page for "fam0"
  And I press "Create Submittal"
  And I fill in "title" with "Some random Title"
  And I fill in "notes" with "We need delegation to come to rescue"
  And I press "Create Submittal"
  Then I should see "Submittal successfully created for family: fam0"

Scenario: try create a submittal with no fields filled out #152941625
  When I am on the show family page for "fam0"
  And I press "Create Submittal"
  And I press "Create Submittal"
  Then I should see "Please fill out all fields"
