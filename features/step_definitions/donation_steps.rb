Given /^I create a donation with the token "([^"]*)" and amount "([^"]*)"$/ do |token, amt|
  visit create_donation_path(token, amt)
end

When /^I should see the stripe form$/ do
  if page.respond_to? :should
    page.should have_css('iframe[name="stripe_checkout_app"]')
  else
    assert page.has_ccss?('iframe[name="stripe_checkout_app"]')
  end
end

Then /^the value of "([^"]*)" should be "([^"]*)"$/ do |field, amt|
  expect(find_field(field).value).to eq amt
end
