require "test_helper"

class Public::SectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_sectors_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_sectors_edit_url
    assert_response :success
  end
end
