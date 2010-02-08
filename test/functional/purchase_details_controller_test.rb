require 'test_helper'

class PurchaseDetailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_detail" do
    assert_difference('PurchaseDetail.count') do
      post :create, :purchase_detail => { }
    end

    assert_redirected_to purchase_detail_path(assigns(:purchase_detail))
  end

  test "should show purchase_detail" do
    get :show, :id => purchase_details(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => purchase_details(:one).to_param
    assert_response :success
  end

  test "should update purchase_detail" do
    put :update, :id => purchase_details(:one).to_param, :purchase_detail => { }
    assert_redirected_to purchase_detail_path(assigns(:purchase_detail))
  end

  test "should destroy purchase_detail" do
    assert_difference('PurchaseDetail.count', -1) do
      delete :destroy, :id => purchase_details(:one).to_param
    end

    assert_redirected_to purchase_details_path
  end
end
