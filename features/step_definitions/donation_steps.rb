Given("I create a donation with the token {string} and amount {string}") do |token, amt|
  visit create_donation_path(token, amt)
end
