require 'test_helper'

class ApplyControllerTest < ActionDispatch::IntegrationTest
  test "there is applying for bail info page" do
    get application_path
    assert_response :success
  end

  test "should get new application page" do
    get new_application_path
    assert_response :success
  end
end
