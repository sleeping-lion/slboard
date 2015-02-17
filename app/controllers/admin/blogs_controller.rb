# encoding: utf-8

class Admin::BlogsController < Admin::AdminController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  def initialize(*params)
    super(*params)
    @controller_name=t('activerecord.models.blog')
    @script="board/index"    
    @meta_description='예쁘고 귀여운 수정이의  FAQ입니다.'
    
    get_menu('blogs')    
  end

  # GET /blogs
  # GET /blogs.json
  def index
    if @menu_setting.use_category
    
      @admin_blog_categories=BlogCategory.where(:enable=>true)
    
      if(params[:blog_category_id])
        @admin_blog_category_id=params[:blog_category_id].to_i
      else
        if @admin_blog_categories[0]
          @admin_blog_category_id=@admin_blog_categories[0].id.to_i
        else
          @admin_blog_category_id=nil        
        end
      end
    
      @admin_blogs = Blog.where(:blog_category_id=>@admin_blog_category_id).order(@menu_setting.order).page(params[:page]).per(@menu_setting.per)      
    else
      @admin_blogs = Blog.order(@menu_setting.order).page(params[:page]).per(@menu_setting.per) 
    end   
    
    respond_to do |format|
      format.html
      format.json { render json: @admin_blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
   @admin_blog_comments=@admin_blog.blog_comment.order('id desc').page(params[:page]).per(10)
   @admin_blog_comment=BlogComment.new
   
   @script="board/show"
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @admin_blog_comments }
    end  
  end

  # GET /blogs/new
  def new
    @admin_blog = Blog.new
    @admin_blog.build_blog_content
    
    @script="board/new"
  end

  # GET /blogs/1/edit
  def edit
    @script="board/edit"  
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @admin_blog = Blog.new(blog_params)
    @admin_blog.user_id=current_user.id
    
    @script="board/new"    

    respond_to do |format|
      if @admin_blog.save
        format.html { redirect_to admin_blogs_url, notice: @controller_name +t(:message_success_create)}
        format.json { render action: 'show', status: :created, location: @admin_blog }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    @script="board/edit"  
  
    respond_to do |format|
      if @admin_blog.update(blog_params)
        format.html { redirect_to admin_blogs_url, notice: @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @admin_blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @admin_blog = Blog.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(:blog_category_id, :user_id, :title, :description, :photo, :photo_cache, blog_content_attributes: [:id,:content])
  end
end