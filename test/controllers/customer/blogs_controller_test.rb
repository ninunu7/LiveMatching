require 'test_helper'

class Customer::BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_blogs_new_url
    assert_response :success
  end

  test "should get index" do
    get customer_blogs_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_blogs_show_url
    assert_response :success
  end

end
