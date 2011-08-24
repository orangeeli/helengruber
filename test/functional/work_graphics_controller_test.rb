require 'test_helper'

class WorkGraphicsControllerTest < ActionController::TestCase

  def setup
    admin = users(:admin)
    session[:user_id] = admin.id
  end

  test "shoud create work graphic" do
    work_piece_id = work_pieces(:first_work_piece).id
    #File.new(Rails.root + 'public/images/rails.png')
    work_graphic_file = fixture_file_upload('files/rails.png','image/png')

    upload = ActionDispatch::Http::UploadedFile.new({
      :filename => 'rails.png',
      :content_type => 'image/png',
      :tempfile => File.new("#{Rails.root}/test/fixtures/files/rails.png")
    })
    
    post :create, {:work_piece_id => work_piece_id, :work_graphic => {:graphic => upload}}
 
    work_graphic = JSON.parse(@response.body)
    assert_equal 'rails.png', work_graphic['work_graphic']['graphic_file_name']
  end

  # should not upload file because user is not authenticated
  test "should not upload file" do
    session[:user_id] = nil
    work_piece_id = work_pieces(:first_work_piece).id
    work_graphic_file = fixture_file_upload('files/rails.png','image/png')

    post :create, {:work_piece_id => work_piece_id, :work_graphic => {:graphic => work_graphic_file}}
    assert_redirected_to root_url 
  end

end
