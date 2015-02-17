# encoding: utf-8

class CreateGroups < ActiveRecord::Migration
  def up
    create_table :groups do |t|
      t.string :title, :null=>false, :limit=>60       
#      t.string :level, :limit=>60, :null=>false
      t.integer :users_count, :null=>false, :default=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
    end
    
#    Group.create_translation_table! :name => {:type => :string, :limit=>60,:null=>false}  
  end
  
  def down
    drop_table :groups
#    Group.drop_translation_table!    
  end  
end
