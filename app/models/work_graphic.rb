class WorkGraphic < ActiveRecord::Base
  has_attached_file :graphic, :default_url => "/images/:style/missing.png", :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :work_piece

  def graphic_file
    graphic.try(:url)
  end

  # We need to send the graphic url in order to present it in the download link
  def as_json(options={})
    methods = (options[:methods] || []) + [:graphic_file]
    super(options.merge(:methods => methods))
  end

end
