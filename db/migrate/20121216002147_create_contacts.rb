# encoding: utf-8

class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, :limit=>60, :null=>false
      t.string :email, :null=>false
      t.string :phone, :limit=>40
      t.string :title,:limit=>60, :null=>false
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps :null=>false
    end
    
    create_table :contact_contents do |t|
      t.boolean :html,:default=>false,:null=>false
      t.text :content,:null=>false
    end
  end
end
