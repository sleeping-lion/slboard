# encoding: utf-8

class GalleryCategory < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :title, :minimum => 2, :maximum => 60, :allow_blank => true  
  has_many :gallery, :dependent=> :destroy
  translates :title  
end
