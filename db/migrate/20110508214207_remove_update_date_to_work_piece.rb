class RemoveUpdateDateToWorkPiece < ActiveRecord::Migration
  def self.up
    remove_column :work_pieces, :updatedate
  end

  def self.down
    add_column :work_pieces, :updatedate, :datetime
  end
end
