require 'test_helper'

class ListOppTrsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_opp_trs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_opp_tr" do
    assert_difference('ListOppTr.count') do
      post :create, :list_opp_tr => { }
    end

    assert_redirected_to list_opp_tr_path(assigns(:list_opp_tr))
  end

  test "should show list_opp_tr" do
    get :show, :id => list_opp_trs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => list_opp_trs(:one).id
    assert_response :success
  end

  test "should update list_opp_tr" do
    put :update, :id => list_opp_trs(:one).id, :list_opp_tr => { }
    assert_redirected_to list_opp_tr_path(assigns(:list_opp_tr))
  end

  test "should destroy list_opp_tr" do
    assert_difference('ListOppTr.count', -1) do
      delete :destroy, :id => list_opp_trs(:one).id
    end

    assert_redirected_to list_opp_trs_path
  end
end
