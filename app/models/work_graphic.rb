class WorkGraphic < ActiveRecord::Base
  has_attached_file :graphic, 
    :default_url => "/images/:style/missing.png", 
    :path => "/graphics/:id/:style/:filename",
    :styles => { :medium => "300x100>", :thumb => "100x50>" },
    :storage => :s3,
    :bucket => 'helengruber.media',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    }
  
  belongs_to :work_piece

  def graphic_file
    graphic.try(:url)
  end

  # We need to send the graphic url in order to present it in the download link
  def as_json(options={})
    methods = (options[:methods] || []) + [:graphic_file]
    super(options.merge(:methods => methods))
  end

  before_destroy :clear_graphic

  def clear_graphic
    self.graphic.clear
  end

end
