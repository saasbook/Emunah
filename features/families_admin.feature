Feature: Admins should be able to create, update, and delete families
 
  As an admin of Emunah's congregation
  So that I have access to the features provided on the website
  I want to be able to create, update, and delete a family

Background: I should be on the home page and logged in.
  
  Given the following users exist:
  | email                 | password | full_name   | role  |
  | seth.martin@gmail.com | abcdef   | Seth Martin | admin |
  | wli2@berkeley.edu     | 123456   | Wayne Li    | user  |
  
  And the following families exist:
  | family_name | discovery | hobbies | skills | activities | committees | membership |
  | fam1        | outreach  | none    | none   | none       | com1       | member     |
  | fam2        | born_into | none    | none   | none       | com2       | non-member |

  And the following people exist:
  | first_name | last_name | hebrew_name | birthday | home_address | telephone | telephone_type | email_address | employer | occupation | anniversary | is_child | allow_contact | family_id |
  | first1     | last1     | hebrew1     | birth1   | home1        | tele1     | tele_num_type1 | email1        | emplo1   | job1       | non1        | False    | yes           | 1         |
  | first2     | last2     | hebrew2     | birth2   | home2        | tele2     | tele_num_type2 | email2        | emplo2   | job2       | non2        | True     | no            | 2         |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"
  And I fill in "Email" with "seth.martin@gmail.com"
  And I fill in "Password" with "abcdef"
  And I press "Log In"
  Then I should see "Welcome Seth Martin"

Scenario: block creating families with no people #152940813
  When I go to the "Create Family" page
  And I press "Create Family"
  Then I should see "Person1 needs a last name."

Scenario: create a family with one person #152940813
  When I go to the "Create Family" page
  And I fill in "last_name1" with "Takeda"
  And I press "Create Family"
  Then I should see "Takeda was successfully created."

Scenario: create a family with two people #152940813
  When I go to the "Create Family" page
  And I fill in "last_name1" with "Takeda"
  And I fill in "last_name2" with "Li"
  And I press "Create Family"
  Then I should see "Takeda was successfully created."

Scenario: update a family #152940884
  When I am on the edit family page for "fam1"
  When I fill in "hobbies" with "Cooking"
  And I press "Update Family"
  Then I should see "fam1 was successfully updated."

Scenario: check person information #152941019
  When I am on the show person page for "last1"
  Then I should see "Showing information for first1"

Scenario: add person to a family #152940978
  When I am on the edit family page for "fam1"
  And I press "Add Person"
  And I fill in "first_name" with "first"
  And I fill in "last_name" with "last"
  And I fill in "hebrew_name" with "hebrew3"
  And I select the time 1990-January-1 from "Birthday"
  And I fill in "home_address" with "home3"
  And I fill in "telephone" with "tele3"
  And I fill in "telephone_type" with "tele_num_type3"
  And I fill in "email_address" with "email3"
  And I fill in "employer" with "emplo3"
  And I fill in "occupation" with "job3" 
  And I press "Add"
  Then I should see "first was successfully added to fam1!"

Scenario: update a person name #152940884
  When I am on the edit person page for "last1"
  When I fill in "last_name" with "last3"
  And I press "Update Person"
  Then I should see "first1 was successfully updated."
