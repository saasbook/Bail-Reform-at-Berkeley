Feature: Disable payment button if no amount is entered

  As someone interested in donating
  I want the donate button to be disabled when I've not entered an amount
  So that I don't accidentally click it

Scenario: No amount is entered
Given I am on the new donation page
Then "Pay with Card" should be disabled

@javascript
Scenario: An amount is entered
Given I am on the new donation page
When I fill in "amount" with "500"
Then "Pay with Card" should be enabled

@javascript
Scenario: An amount is entered and then deleted
Given I am on the new donation page
And I fill in "amount" with "500"
When I fill in "amount" with ""
Then "Pay with Card" should be disabled
