Feature: login returning users
  As a returning user
  I want to be able to login
  So that I can save my data

Scenario: correct login info
  Given user "fred@gmail.com" with password "123456" exists
  And I am on the login page
  When I fill in "Email" with "fred@gmail.com"
  And I fill in "Password" with "123456"
  And I press the "Log In" button
  Then I should be on the home page

Scenario: wrong login info
  Given user "fred@gmail.com" with password "123456" exists
  And I am on the login page
  When I fill in "Email" with "fred@gmail.com"
  And I fill in "Password" with "111111"
  And I press the "Log In" button
  Then I should be on the login page
  And I should see "Invalid Email or password"

Scenario: logout button on navbar
  Given user "fred@gmail.com" with password "123456" is logged in
  And I am on the home page
  Then I should see "Logout"
  And I should not see "Login"

Scenario: login button on navbar
  Given user "fred@gmail.com" with password "123456" is logged in
  And I follow "Logout"
  Then I should be on the home page
  And I should not see "Logout"
  And I should see "Login"
  And I should see "Signed out successfully."
