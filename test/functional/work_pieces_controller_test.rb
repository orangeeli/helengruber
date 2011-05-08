require 'test_helper'

class WorkPiecesControllerTest < ActionController::TestCase
  setup do
    @work_piece = work_pieces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_pieces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_piece" do
    assert_difference('WorkPiece.count') do
      post :create, :work_piece => @work_piece.attributes
    end

    assert_redirected_to work_piece_path(assigns(:work_piece))
  end

  test "should show work_piece" do
    get :show, :id => @work_piece.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @work_piece.to_param
    assert_response :success
  end

  test "should update work_piece" do
    put :update, :id => @work_piece.to_param, :work_piece => @work_piece.attributes
    assert_redirected_to work_piece_path(assigns(:work_piece))
  end

  test "should destroy work_piece" do
    assert_difference('WorkPiece.count', -1) do
      delete :destroy, :id => @work_piece.to_param
    end

    assert_redirected_to work_pieces_path
  end
end
