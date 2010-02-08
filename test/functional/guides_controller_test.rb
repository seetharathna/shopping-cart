require 'test_helper'

class GuidesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guide" do
    assert_difference('Guide.count') do
      post :create, :guide => { }
    end

    assert_redirected_to guide_path(assigns(:guide))
  end

  test "should show guide" do
    get :show, :id => guides(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => guides(:one).to_param
    assert_response :success
  end

  test "should update guide" do
    put :update, :id => guides(:one).to_param, :guide => { }
    assert_redirected_to guide_path(assigns(:guide))
  end

  test "should destroy guide" do
    assert_difference('Guide.count', -1) do
      delete :destroy, :id => guides(:one).to_param
    end

    assert_redirected_to guides_path
  end
end
