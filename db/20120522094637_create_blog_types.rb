# encoding: utf-8

class CreateBlogTypes < ActiveRecord::Migration
  def change
    create_table :blog_types do |t|
      t.string :title, :null=>false, :limit=>60
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps :null=>false
    end
  end
end
