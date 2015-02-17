# encoding: utf-8

class Contact < ActiveRecord::Base
  validates_presence_of :title, :content
  validates_length_of :title, :minimum => 4, :maximum => 60, :allow_blank => true
  has_one :contact_content, :foreign_key => :id, :dependent => :destroy    
end
