require 'test_helper'

class Customer::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get customer_searches_top_url
    assert_response :success
  end

  test "should get index" do
    get customer_searches_index_url
    assert_response :success
  end

end
