require "test_helper"

class Admin::SectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sectors_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_sectors_edit_url
    assert_response :success
  end
end
