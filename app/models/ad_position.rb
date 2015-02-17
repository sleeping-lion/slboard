# encoding: utf-8

class AdPosition < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :title, :minimum => 4, :maximum => 60, :allow_blank => true  
end
