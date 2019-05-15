Feature: appropriate text on team page

  As a concerned citizen
  I want to know more about the people in this organization
  So that I know what type of people I'm trusting

Scenario: text on team page
  Given I am on the home page
  When I follow "Meet the Team"
  Then I should see "Gresshaa Mehta"
  And I should see "Thomas Brown"
  And I should see "Co-President"
  And I should see "Zhen Teo"
