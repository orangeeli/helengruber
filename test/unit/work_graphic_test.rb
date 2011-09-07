require 'test_helper'

class WorkGraphicTest < ActiveSupport::TestCase
  
  def setup
    @first_work_graphic = work_graphics(:one)
  
    if @first_work_graphic.graphic_file.include? 'missing'
      @first_work_graphic.graphic = File.new(Rails.root + 'public/images/rails.png')
      @first_work_graphic.save
    end
  end

  # should use assert_match with regex
  test "should return image url" do
    assert_not_nil @first_work_graphic.graphic_file
    assert @first_work_graphic.graphic_file.include? '/graphics/980190962/original/rails.png' #, 'Wrong file path'
  end

  test "should return image json with image url" do
    assert_not_nil @first_work_graphic.graphic_file
    assert @first_work_graphic.as_json["work_graphic"][:graphic_file].include? '/graphics/980190962/original/rails.png' #, 'Wrong file path'
  end

end
