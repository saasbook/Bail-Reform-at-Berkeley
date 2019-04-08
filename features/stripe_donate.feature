Feature: make donation payments using Stripe

  As a concerned citizen
  I want to donate money to Bail Reform at Berkeley
  So that I can help people in need

@javascript
Scenario: choose a donation amount
Given I am on the new donation page
When I fill in "amount" with "500"
And I press "Pay with Card"
Then I should see the stripe form

Scenario: get a valid token
Given I create a donation with the token "tok_visa" and amount "500"
Then I should be on the successful donation page
And I should see "Success"

Scenario: get an invalid token
Given I create a donation with the token "tok_chargeDeclined" and amount "500"
Then I should be on the failed donation page
And I should see "Error"
