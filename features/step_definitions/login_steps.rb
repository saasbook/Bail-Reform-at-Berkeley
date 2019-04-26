Given /^user \"(.+@.+)\" with password \"(.+)\" exists$/ do |email, password|
  @user = FactoryBot.create(:user, email: email, password: password, password_confirmation: password)
end

And /^I press the \"Log In\" button$/ do
  click_button("login-button")
end

Given /^user \"(.+@.+)\" with password \"(.+)\" is logged in$/ do |email, password|
  steps %Q{
    Given user "#{email}" with password "#{password}" exists
    And I am on the login page
    Then I fill in "Email" with "#{email}"
    And I fill in "Password" with "#{password}"
    And I press the "Log In" button 
  }
end
