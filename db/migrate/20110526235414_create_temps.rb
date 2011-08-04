class CreateTemps < ActiveRecord::Migration
  def self.up
    create_table :temps do |t|
      t.decimal :latitude, :precision => 15, :scale => 10
      t.decimal :longitude, :precision => 15, :scale => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :temps
  end
end
