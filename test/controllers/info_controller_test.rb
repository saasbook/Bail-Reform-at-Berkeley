require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_path
    assert_response :success
  end

  test "should get about us page" do
    get about_path
    assert_response :success
  end

  test "should get team page" do
    get team_path
    assert_response :success
  end

  test "should have participation info page" do
    get participate_path
    assert_response :success
  end

  test "should have faq page" do
    get faq_path
    assert_response :success
  end

  test "should have blog page" do
    get blog_path
    assert_response :success
  end

  test "should have contact page" do
    get contact_path
    assert_response :success
  end

  test "should have sign in page" do
    get sign_in_path
    assert_response :success
end
