class AddInsertDateToWorkPiece < ActiveRecord::Migration
  def self.up
    add_column :work_pieces, :insertdate, :datetime
  end

  def self.down
    remove_column :work_pieces, :insertdate
  end
end
