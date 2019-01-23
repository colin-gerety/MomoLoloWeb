require 'test_helper'

class SupplierItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get supplier_items_new_url
    assert_response :success
  end

  test "should get show" do
    get supplier_items_show_url
    assert_response :success
  end

end
