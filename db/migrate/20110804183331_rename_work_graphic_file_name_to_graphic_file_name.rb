class RenameWorkGraphicFileNameToGraphicFileName < ActiveRecord::Migration
  def self.up
    rename_column :work_graphics, :file_name, :graphic_file_name
  end

  def self.down
    rename_column :work_graphics, :graphic_file_name, :file_name
  end
end
