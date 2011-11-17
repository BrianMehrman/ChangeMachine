require 'test_helper'

class CoinSetsControllerTest < ActionController::TestCase
  setup do
    @coin_set = coin_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coin_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coin_set" do
    assert_difference('CoinSet.count') do
      post :create, coin_set: @coin_set.attributes
    end

    assert_redirected_to coin_set_path(assigns(:coin_set))
  end

  test "should show coin_set" do
    get :show, id: @coin_set.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coin_set.to_param
    assert_response :success
  end

  test "should update coin_set" do
    put :update, id: @coin_set.to_param, coin_set: @coin_set.attributes
    assert_redirected_to coin_set_path(assigns(:coin_set))
  end

  test "should destroy coin_set" do
    assert_difference('CoinSet.count', -1) do
      delete :destroy, id: @coin_set.to_param
    end

    assert_redirected_to coin_sets_path
  end
end
