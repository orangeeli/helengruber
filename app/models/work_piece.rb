class WorkPiece < ActiveRecord::Base

  has_many :work_graphics
  belongs_to :section
 
  self.per_page = 1
  default_scope :include => [:work_graphics, :section]

  # accepts_nested_attributes_for :section, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

end
