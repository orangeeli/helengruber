class WorkPiece < ActiveRecord::Base

  has_many :work_graphics

  default_scope :include => [:work_graphics]

end
