#encoding: utf-8

class CreateBlogCategoryRels < ActiveRecord::Migration
  def change
    create_table :blog_category_rels do |t|
      t.references :blog_category, :null=>false
      t.timestamps :null=>false
    end
    
    add_column :blog_category_rels, :blog_category_rel_id, :integer, :null=>false, :after=>:blog_category_id
    add_index :blog_category_rels, :blog_category_id
    add_index :blog_category_rels, :blog_category_rel_id
    add_index :blog_category_rels, [:blog_category_id, :blog_category_rel_id], :unique=>true, :name=>'blog_category_rels_unuque'
  end
end
