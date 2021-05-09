require 'test_helper'

class Customer::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_events_new_url
    assert_response :success
  end

  test "should get edit" do
    get customer_events_edit_url
    assert_response :success
  end

end
