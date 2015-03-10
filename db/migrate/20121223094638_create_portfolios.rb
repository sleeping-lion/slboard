# encoding: utf-8

class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.references :user,:null=>false      
      t.string :title, :limit=>60, :null=>false
      t.string :url, :null=>false
      t.text :description, :null=>false
      t.string :photo,:null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.integer :count, :null=>false, :default=>0    
      t.timestamps :null=>false
    end
    
    create_table :portfolio_contents do |t|
      t.text :content,:null=>false
    end
    
    add_index :portfolios, :user_id    
  end
end
