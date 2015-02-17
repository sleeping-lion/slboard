# encoding: utf-8

require 'carrierwave/orm/activerecord'

class UserPhoto < ActiveRecord::Base
  validates_presence_of :photo, :alt
  belongs_to :user, :autosave=>true
  accepts_nested_attributes_for :user, :allow_destroy => true  
  mount_uploader :photo, UserPhotoUploader  
end
