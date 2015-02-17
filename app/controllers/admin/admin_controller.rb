# encoding: utf-8

class Admin::AdminController < ApplicationController
  layout 'admin/application'
  before_filter :authenticate_user!,:only => [:index,:new,:create,:show,:edit, :update, :destroy]
  
  def initialize(*params)
    super(*params)
    
    @script='notices'
  end
  
  def set_resources
    @resources = Resource.order([:priority,:id])
  end  
end
