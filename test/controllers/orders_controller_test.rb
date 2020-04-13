require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get checkout" do
    get orders_checkout_url
    assert_response :success
  end

end
