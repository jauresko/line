require 'test_helper'

class PurchaseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get purchase_new_url
    assert_response :success
  end

  test "should get edit" do
    get purchase_edit_url
    assert_response :success
  end

  test "should get index" do
    get purchase_index_url
    assert_response :success
  end

  test "should get show" do
    get purchase_show_url
    assert_response :success
  end

end
