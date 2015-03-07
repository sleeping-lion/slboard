# encoding: utf-8

class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faq_categories do |t|
      t.references :user, :null=>false
      t.string :title,:null=>false
      t.integer :faqs_count, :null=>false, :default=>0      
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
    end  
  
    create_table :faqs do |t|
      t.references :faq_category,:null=>false   
      t.references :user,:null=>false
      t.string :title,:null=>false
      t.integer :count,:default=>0,:null=>false
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps
    end
    
    create_table :faq_contents do |t|
      t.text :content      
    end
    
    add_index :faq_categories, :user_id    
    add_index :faqs, :faq_category_id
    add_index :faqs, :user_id     
  end
end
