class RenameUserPasswordToPasswordSalt < ActiveRecord::Migration
  def self.up
    rename_column :users, :password, :password_salt
  end

  def self.down
    rename_column :users, :password_salt, :password
  end
end
