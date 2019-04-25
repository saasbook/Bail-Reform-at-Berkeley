Given /^user \"(.+@.+)\" with password \"(.+)\" exists$/ do |email, password|
  @user = FactoryBot.create(:user, email: email, password: password, password_confirmation: password)
end

And /^I press the \"Log In\" button$/ do
  click_button("login-button")
end
