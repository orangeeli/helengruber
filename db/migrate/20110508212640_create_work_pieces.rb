class CreateWorkPieces < ActiveRecord::Migration
  def self.up
    create_table :work_pieces do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :work_pieces
  end
end
