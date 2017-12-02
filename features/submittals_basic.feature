Feature: Users (Basic or Admin) can create, update, and delete submittals.
 
  As an member of Emunah's congregation
  So that I can contribute to the membership of my organization
  I want to be able to create, update, and delete new submittals 

Background: Wayne, a user, has logged in
  
  Given the following users exist:
  | email                 | password | full_name   | role |
  | wayne.li@gmail.com    | abcdef   | Wayne Li    | user     |

  Given the following families exist:
  | family_name    |
  | fam0           |

  Given the following submittal exist:
  | family_id | title            | notes   | access_level          | user_id |
  |    1      | Submittal A      | lmfao   | Financially Sensitive |    1    |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  When I fill in "Email" with "wayne.li@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Wayne Li"

Scenario: approve a submittal #152061046
  When I am on the show family page for "fam0"
  And I go to the approve submittals page "Submittal A"
  Then I should see "Unauthorized"

Scenario: revoke a submittal #152061046
  When I am on the show family page for "fam0"
  And I go to the approve submittals page "Submittal A"
  And I go to the revoke submittals page "Submittal A"   
  Then I should see "Unauthorized"