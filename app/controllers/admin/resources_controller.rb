# encoding: utf-8

class Admin::ResourcesController < Admin::AdminController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  
  def initialize(*params)
    super(*params)
    @controller_name=t('activerecord.models.resource')
  end

  # GET /admin/menus
  # GET /admin/menus.json
  def index
    @admin_resources = Resource.order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /admin/menus/1
  # GET /admin/menus/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /admin/menus/new
  # GET /admin/menus/new.json
  def new
    @admin_resource = Resource.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_resource }
    end
  end

  # GET /admin/menus/1/edit
  def edit
    
  end

  # POST /admin/menus
  # POST /admin/menus.json
  def create
    @admin_resource = Resource.new(resource_params)

    respond_to do |format|
      if @admin_resource.save
        format.html { redirect_to admin_menus_url, notice: '공지사항이 작성되었습니다.' }
        format.json { render json: @admin_resource, status: :created, location: @admin_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/menus/1
  # PUT /admin/menus/1.json
  def update

    respond_to do |format|
      if @admin_resource.update_attributes(resource_params)
        format.html { redirect_to admin_menus_url, notice: '공지사항이 수정되었습니다.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/menus/1
  # DELETE /admin/menus/1.json
  def destroy
    @admin_resource.destroy

    respond_to do |format|
      format.html { redirect_to admin_menus_url }
      format.json { head :no_content }
    end
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @admin_resource = Resource.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:admin_resource).permit(:id,:faq_category_id,:title)
  end    
end
