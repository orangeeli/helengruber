class AddColumnGraphicUpdatedAtToWorkGraphics < ActiveRecord::Migration
  def self.up
    add_column :work_graphics, :graphic_updated_at, :datetime
  end

  def self.down
    remove_column :work_graphics, :graphic_updated_at
  end
end
