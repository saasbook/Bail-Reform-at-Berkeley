Feature: users can sign up
  As someone who desires bail
  I want to be able to register
  So that I can access my saved applications

Scenario: signup works
  Given I am on the registration page
  When I fill in "Email" with "iamexciting@mailinator.com"
  And I fill in "Password" with "ThisIsASecurePassword"
  And I fill in "Password confirmation" with "ThisIsASecurePassword"
  And I press the "Sign Up" button
  Then I should be on the home page
  And I should see "Welcome! You have signed up successfully."
  And I should see "Logout"
