# encoding: utf-8

class Admin::FaqsController < Admin::AdminController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  
  def initialize(*params)
    super(*params)   
    @controller_name=t('activerecord.models.faq')
    @script="board/index"
    @meta_description='예쁘고 귀여운 수정이의  FAQ입니다.'
    
    get_menu('faqs')
  end
  
  # GET /faqs
  # GET /faqs.json
  def index
    @admin_faq_categories = FaqCategory.all
    
    if(params[:faq_category_id])
      @categoryId=params[:faq_category_id].to_i
    else
      if @admin_faq_categories[0]
        @categoryId=@admin_faq_categories[0].id.to_i
      else
        @categoryId=nil        
      end
    end
    
    @admin_faqs = Faq.where(:faq_category_id=>@categoryId).order(@menu_setting.order).page(params[:page]).per(@menu_setting.per)
    
    if(params[:id])
      @admin_faq = Faq.find(params[:id])
    end
    
    @script='faqs'
    
    admin=false
    if(current_user)
      if(current_user.admin)
        admin=true
      end
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {:faqs=>@admin_faqs,:admin=>admin} }
    end
  end
  
  # GET /faqs/1
  # GET /faqs/1.json
  def show
    @admin_faqContent=FaqContent.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_faqContent }
    end
  end
  
  # GET /faqs/new
  # GET /faqs/new.json
  def new
    @admin_faq = Faq.new
    @admin_faq.build_faq_content
    @admin_faq_categories = FaqCategory.all
    @admin_faq_category_id=params[:faq_category_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_faq }
    end
  end
  
  # GET /faqs/1/edit
  def edit
    @admin_faq_categories = FaqCategory.all
    @admin_faq_category_id=@admin_faq.faq_category.id
  end
  
  # POST /faqs
  # POST /faqs.json
  def create
    @admin_faq = Faq.new(faq_params)
    
    respond_to do |format|
      if @admin_faq.save
        format.html { redirect_to admin_faqs_url, :notice=> @controller_name +t(:message_success_create)}
        format.json { render json: @admin_faq, status: :created, location: @admin_faq }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_faq.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /faqs/1
  # PUT /faqs/1.json
  def update
    @admin_faq = Faq.find(params[:id])
    
    respond_to do |format|
      if @admin_faq.update_attributes(faq_params)
        format.html { redirect_to admin_faqs_url, :notice=> @controller_name +t(:message_success_update)}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_faq.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    @admin_faq.destroy
    
    respond_to do |format|
      format.html { redirect_to admin_faqs_url}
      format.json { head :ok }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_faq
    @admin_faq = Faq.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def faq_params
    params.require(:faq).permit(:id,:faq_category_id,:title)
  end  
end