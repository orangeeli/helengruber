class RemoveInsertDateToWorkPiece < ActiveRecord::Migration
  def self.up
    remove_column :work_pieces, :insertdate
  end

  def self.down
    add_column :work_pieces, :insertdate, :datetime
  end
end
