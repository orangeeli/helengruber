class RenameWorkGraphicContentTypeToGraphicContentType < ActiveRecord::Migration
  def self.up
    rename_column :work_graphics, :content_type, :graphic_content_type
  end

  def self.down
    rename_column :work_graphics, :graphic_content_type, :content_type
  end
end
