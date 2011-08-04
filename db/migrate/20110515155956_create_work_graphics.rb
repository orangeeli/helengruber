class CreateWorkGraphics < ActiveRecord::Migration
  def self.up
    create_table :work_graphics do |t|
      t.string :file_name
      t.string :content_type
      t.integer :file_size
      t.datetime :updated_at
      t.references :work_piece

      t.timestamps
    end
  end

  def self.down
    drop_table :work_graphics
  end
end
