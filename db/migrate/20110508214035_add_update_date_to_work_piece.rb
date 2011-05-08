class AddUpdateDateToWorkPiece < ActiveRecord::Migration
  def self.up
    add_column :work_pieces, :updatedate, :datetime
  end

  def self.down
    remove_column :work_pieces, :updatedate
  end
end
