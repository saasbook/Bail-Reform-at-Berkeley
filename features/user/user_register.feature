Feature: users can sign up
  As someone who desires bail
  I want to be able to register
  So that I can access my saved applications

Scenario: signup works
  Given I am on the registration page
  When I fill in "Email" with "iamexciting@mailinator.com"
  And I fill in "Password" with "ThisIsASecurePassword"
  And I fill "Password confirmation" with "ThisIsASecurePassword"
  And I press the "Sign Up" button
  Then I should be on the home page
  And I should see "Welcome! You have signed up successfully."
  And I should see "Logout"

Scenario: can't sign up twice
  Given user "fred@gmail.com" with password "123456" exists
  And I am on the registration page
  When I fill in "Email" with "iamexciting@mailinator.com"
  And I fill in "Password" with "ThisIsASecurePassword"
  And I fill "Password confirmation" with "ThisIsASecurePassword"
  And I press the "Sign Up" button
  Then I should be on the registration page
  And I should see "Email has already been taken"
