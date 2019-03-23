require 'test_helper'

class DonateControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_donation_path
    assert_response :success
  end

end
