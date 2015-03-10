# encoding: utf-8
class CreateUserPhotos < ActiveRecord::Migration
  def change
    create_table :user_photos do |t|
      t.references :user, :null=>false
      t.string :photo, :null=>false
      t.string :alt,:limit=>60, :null=>false
      t.boolean :default, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>1
      t.timestamps :null=>false
    end

    add_index :user_photos, :user_id
  end
end
