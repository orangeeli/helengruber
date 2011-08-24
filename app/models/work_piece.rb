class WorkPiece < ActiveRecord::Base

  has_many :work_graphics
  belongs_to :section
 
  self.per_page = 5
  default_scope :include => [:work_graphics, :section]

  accepts_nested_attributes_for :work_graphics, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  before_destroy :mark_children_for_removal

  # marking objects for destruction brute force version. Only works if you save parent. Going through each element and destroy it is not very efficient
  def mark_children_for_removal
    work_graphics.each do |work_graphic|
      work_graphic.destroy
    end
  end
end
