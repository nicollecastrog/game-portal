require 'test_helper'

class TictacsControllerTest < ActionController::TestCase
  setup do
    @tictac = tictacs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tictacs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tictac" do
    assert_difference('Tictac.count') do
      post :create, tictac: { game_id: @tictac.game_id, player1: @tictac.player1, player2: @tictac.player2, result: @tictac.result, sq0: @tictac.sq0, sq1: @tictac.sq1, sq2: @tictac.sq2, sq3: @tictac.sq3, sq4: @tictac.sq4, sq5: @tictac.sq5, sq6: @tictac.sq6, sq7: @tictac.sq7, sq8: @tictac.sq8 }
    end

    assert_redirected_to tictac_path(assigns(:tictac))
  end

  test "should show tictac" do
    get :show, id: @tictac
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tictac
    assert_response :success
  end

  test "should update tictac" do
    put :update, id: @tictac, tictac: { game_id: @tictac.game_id, player1: @tictac.player1, player2: @tictac.player2, result: @tictac.result, sq0: @tictac.sq0, sq1: @tictac.sq1, sq2: @tictac.sq2, sq3: @tictac.sq3, sq4: @tictac.sq4, sq5: @tictac.sq5, sq6: @tictac.sq6, sq7: @tictac.sq7, sq8: @tictac.sq8 }
    assert_redirected_to tictac_path(assigns(:tictac))
  end

  test "should destroy tictac" do
    assert_difference('Tictac.count', -1) do
      delete :destroy, id: @tictac
    end

    assert_redirected_to tictacs_path
  end
end
