Feature: display a donate button

  As concerned citizen
  I want see a link to donate
  So that I can donate

Scenario: donate button on home page
  Given I am on the home page
  When I press "Donate"
  Then I should be on the donate page
  And I should see "Donate"
