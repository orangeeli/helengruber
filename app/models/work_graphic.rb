class WorkGraphic < ActiveRecord::Base
  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :work_piece
end
