Feature: Admins should be able to create, update, and delete families
 
  As an admin of Emunah's congregation
  So that I have access to the features provided on the website
  I want to be able to create, update, and delete a family

Background: I should be on the home page and logged in.
  
  Given the following users exist:
  | email                 | password | full_name   | is_admin |
  | seth.martin@gmail.com | abcdef   | Seth Martin | Yes      |
  | wli2@berkeley.edu     | 123456   | Wayne Li    | No       |
  
  And the following families exist:
  | family_name |
  | fam1        |
  | fam2        |

  And the following people exist:
  | full_name | hebrew_name | birthday | home_address | telephone | telephone_type | email_address | employer | occupation | anniversary | is_child | discovery | hobbies | skills | activities | committees | allow_contact |
  | full1     | hebrew1     | birth1   | home1        | tele1     | tele_num_type1 | email1        | emplo1   | job1       | non1        | False    | outreach  | none    | none   | none       | com1       | yes           |
  | full2     | hebrew2     | birth2   | home2        | tele2     | tele_num_type2 | email2        | emplo2   | job2       | non2        | True     | born_into | none    | none   | none       | com2       | no            |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  And I fill in "Email" with "seth.martin@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Martin"

Scenario: create a family
  When I go to the "Create Family" page
  And I fill in "Family" with "fam3"
  And I press "Create Family"
  Then I should see "fam3 was successfully created."

Scenario: only one unique family persists in database
  When I go to the "Create Family" page
  And I fill in "Family" with "fam1"
  And I press "Create Family"
  Then I should see "fam1 already exists."

Scenario: update a family name
  When I am on the family page for "fam1"
  When I follow "Edit Family"
  When I fill in "Family Name" with "ultra_fam"
  And I press "Update Family"
  Then I should see "ultra_fam's family name was successfully updated."

Scenario: add people to a family 
  When I am on the family page for "fam1"
  When I follow "Edit Family"
  
  

Scenario: one person should only be in one family
  When I am on the family page for "fam1"
  When I follow "Edit Family"
  
  

Scenario: unable to add a person to an non-existing family
  When I am on the family page for "fam1"
  When I follow "Edit Family"
  

Scenario: delete a family
  When I am on the family page for "fam1"
  When I follow "Delete Family"
  Then I should see "Family deleted."
