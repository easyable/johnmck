class AddApproveBoolToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :approve_bool, :string
  end

  def self.down
    remove_column :comments, :approve_bool
  end
end
