require 'test_helper'

class DonateControllerTest < ActionDispatch::IntegrationTest
  test "should get info page" do
    get donation_path
    assert_response :success
  end

  test "should get new" do
    get new_donation_path
    assert_response :success
  end

  test "should get create" do
    get create_donation_path("123", "500")
    assert_response :redirect
  end

  test "should get success" do
    get successful_donation_path
    assert_response :success
  end

  test "should get failure" do
    get failed_donation_path
    assert_response :success
  end

end
