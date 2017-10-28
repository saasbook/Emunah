Feature: Admins should be able to create, update, and delete families
 
  As an admin of Emunah's congregation
  So that I have access to the features provided on the website
  I want to be able to create, update, and delete a family

Background: I should be on the home page and logged in.

  Given the following people exist:
  | full_name | hebrew_name | family | birthdate | home_address | telephone_number | telephone_number_type | email_address | employer | occupation | anniversary | is_child | parent_name |
  | full1     | hebrew1     | fam1   | birth1    | home1        | tele1            | tele_num_type1        | email1        | emplo1   | job1       | non1        | False    | None        |
  | full2     | hebrew2     | fam1   | birth2    | home2        | tele2            | tele_num_type2        | email2        | emplo2   | job2       | non2        | True     | full1       |

  Given the following families exist:
  | family | members_count |
  | fam1   | 2             |
  | fam2   | 0             |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  And I fill in "Email" with "seth.martin@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Martin!"

Scenario: create a family
  When I go to the "Create Family" page
  And I fill in "Family" with "fam3"
  And I press "Create Family"
  Then I should see "fam3 was successfully created."

Scenario: only one unique family persists in database
  When I go to the "Create Family" page
  And I fill in "Family" with "fam3"
  And I press "Create Family"
  Then I should see "fam3 already exists."

Scenario: update a family name
  When I go to the "Edit Family" page
  And I fill in "Family" with "fam1"
  Then I should see "Information for fam1"
  When I fill in "Family" with "ultra_fam"
  And I press "Finish Editing"
  Then I should see "ultra_fam's information has been updated."

Scenario: add people to a family 
  When I go to the "Edit Family" page
  And I press in "Add User to Family"
  And I fill in "full_name" with "full3"
  And I fill in "hebrew_name" with "hebrew3"
  And I fill in "family" with "fam1"
  And I fill in "birthdate" with "birth3"
  And I fill in "home_address" with "home3"
  And I fill in "telephone_number" with "tele3"
  And I fill in "telephone_number_type" with "tele_num_type3"
  And I fill in "email_address" with "email3"
  And I fill in "employer" with "emplo3"
  And I fill in "occupation" with "job3" 
  And I fill in "anniversary" with "non3"
  And I fill in "is_child" with "False"
  And I fill in "parent_name" with "None"
  And I press "Add"
  Then I should see "full3 was successfully added to fam1"

Scenario: one person should only be in one family
  When I go to the "Edit Family" page
  And I press in "Add User to Family"
  And I fill in "full_name" with "full1"
  And I fill in "hebrew_name" with "hebrew3"
  And I fill in "family" with "fam1"
  And I fill in "birthdate" with "birth3"
  And I fill in "home_address" with "home3"
  And I fill in "telephone_number" with "tele3"
  And I fill in "telephone_number_type" with "tele_num_type3"
  And I fill in "email_address" with "email3"
  And I fill in "employer" with "emplo3"
  And I fill in "occupation" with "job3" 
  And I fill in "anniversary" with "non3"
  And I fill in "is_child" with "False"
  And I fill in "parent_name" with "None"
  And I press "Add"
  Then I should see "full1 already exists in fam1"

Scenario: unable to add a person to an non-existing family
  When I go to the "Edit Family" page
  And I press in "Add User to Family"
  And I fill in "full_name" with "full1"
  And I fill in "hebrew_name" with "hebrew3"
  And I fill in "family" with "non_exist"
  And I fill in "birthdate" with "birth3"
  And I fill in "home_address" with "home3"
  And I fill in "telephone_number" with "tele3"
  And I fill in "telephone_number_type" with "tele_num_type3"
  And I fill in "email_address" with "email3"
  And I fill in "employer" with "emplo3"
  And I fill in "occupation" with "job3" 
  And I fill in "anniversary" with "non3"
  And I fill in "is_child" with "False"
  And I fill in "parent_name" with "None"
  And I press "Add"
  Then I should see "non_exist family doesn't exist!"

Scenario: delete a family
  When I go to the "Delete Family" page
  And I fill in "Family" with "fam1"
  And I press "Delete"
  Then I should see "fam1 was deleted."

Scenario: delete a family that doesn't exist
  When I go to the "Delete Family" page
  And I fill in "Family" with "fam4"
  And I press "Delete"
  Then I should see "fam4 does not exist."
