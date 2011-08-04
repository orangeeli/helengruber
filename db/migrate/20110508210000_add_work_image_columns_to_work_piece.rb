class AddWorkImageColumnsToWorkPiece < ActiveRecord::Migration
  def self.up
    add_column :work_pieces, :work_image_file_name,    :string
    add_column :work_pieces, :work_image_content_type, :string
    add_column :work_pieces, :work_image_file_size,    :integer
    add_column :work_pieces, :work_image_updated_at,   :datetime
  end

  def self.down
    remove_column :work_pieces, :work_image_file_name
    remove_column :work_pieces, :work_image_content_type
    remove_column :work_pieces, :work_image_file_size
    remove_column :work_pieces, :work_image_updated_at
  end
end
