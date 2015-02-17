# encoding: utf-8

class BlogType < ActiveRecord::Base 
  validates_presence_of :title
  validates_length_of :title, :minimum => 4, :maximum => 60, :allow_blank => true  
  has_many :blog_category
end
