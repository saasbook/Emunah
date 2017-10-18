Feature: Users are allowed to navigate the different categories of the database

  As a member of Emunah's congregation
  So that I can get access to the features provided on the website
  I want to be search different categories within the database

Background: Users have submitted the following information into the family database
  Given the following categories exist:
  | family name | tags     |
  | Emunah      | children |

  Given the following items exist:
  | name  | date   |
  | Seth    | 17-10-2004 |

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