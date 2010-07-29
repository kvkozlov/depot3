require 'test_helper'

class ListStrWksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_str_wks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_str_wk" do
    assert_difference('ListStrWk.count') do
      post :create, :list_str_wk => { }
    end

    assert_redirected_to list_str_wk_path(assigns(:list_str_wk))
  end

  test "should show list_str_wk" do
    get :show, :id => list_str_wks(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => list_str_wks(:one).id
    assert_response :success
  end

  test "should update list_str_wk" do
    put :update, :id => list_str_wks(:one).id, :list_str_wk => { }
    assert_redirected_to list_str_wk_path(assigns(:list_str_wk))
  end

  test "should destroy list_str_wk" do
    assert_difference('ListStrWk.count', -1) do
      delete :destroy, :id => list_str_wks(:one).id
    end

    assert_redirected_to list_str_wks_path
  end
end
