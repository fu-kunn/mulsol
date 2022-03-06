require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_customers_top_url
    assert_response :success
  end
end
