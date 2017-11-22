Feature: Admin or Confidential User can approve and revoke submittals
 
  As a concierge, 
  so that only approved material is displayed on sate,
  all submittal information should be reviewed before others can view it.

Background: Seth, an admin, has logged in
  
  Given the following users exist:
  | email                 | password | full_name   | role |
  | wayne.li@gmail.com    | abcdef   | Wayne Li    | confidential user |

  Given the following families exist:
  | family_name    |
  | fam0           |

  Given the following submittal exist:
  | family_id | title            | notes   | access_level          | user_id |
  |    0      | Submittal A     | "something" | Financially Sensitive |    0    |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  When I fill in "Email" with "wayne.li@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Wayne Li"

Scenario: approve a submittal #152061046
  When I am on the show family page for "fam0"
  And I go to the approve submittals page "Submittal A"
  Then I should see "Submittal was successfully approved."

Scenario: revoke a submittal #152061046
  When I am on the show family page for "fam0"
  And I go to the approve submittals page "Submittal A"
  And I go to the revoke submittals page "Submittal A"
  Then I should see "Submittal was successfully revoked."
