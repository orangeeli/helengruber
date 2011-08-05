class RenameWorkGraphicFileSizeToGraphicFileSize < ActiveRecord::Migration
  def self.up
    rename_column :work_graphics, :file_size, :graphic_file_size
  end

  def self.down
    rename_column :work_graphics, :graphic_file_size, :file_size
  end
end
