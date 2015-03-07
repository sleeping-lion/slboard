# encoding: utf-8

class CreateSettingControllerPhotos < ActiveRecord::Migration
  def change
    create_table :setting_controller_photos do |t|
      t.references :setting_controller, :null=>false
      t.string :photo, :null=>false
      t.string :alt,:limit=>60, :null=>false
      t.boolean :enable, :null=>false, :default=>1
      t.timestamps :null=>false
    end
   
    add_index :setting_controller_photos, :setting_controller_id
  end
end
