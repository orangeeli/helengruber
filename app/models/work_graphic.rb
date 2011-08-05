class WorkGraphic < ActiveRecord::Base
  has_attached_file :graphic, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :work_piece


  def graphic_file
    graphic.try(:url)
  end
end
