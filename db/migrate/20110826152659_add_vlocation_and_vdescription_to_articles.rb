class AddVlocationAndVdescriptionToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :vlocation, :string
    add_column :articles, :vdescription, :text
  end

  def self.down
    remove_column :articles, :vdescription
    remove_column :articles, :vlocation
  end
end
