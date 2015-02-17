# encoding: utf-8

class Admin::HistoriesController < Admin::AdminController
  before_action :set_history, only: [:show, :edit, :update, :destroy]  
  
  def initialize(*params)
    super(*params)
    @controller_name='수정이 요리'
  end
  
  # GET /histories
  # GET /histories.json
  def index
    @admin_histories = History.order('id desc').page(params[:page]).per(10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_histories }
    end
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_history }
    end
  end

  # GET /histories/new
  # GET /histories/new.json
  def new
    @admin_history = History.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_history }
    end
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    @admin_history = History.new(history_params)
    @admin_history.user_id=current_user.id

    respond_to do |format|
      if @admin_history.save
        format.html { redirect_to admin_histories_path, :notice=> @controller_name +t(:message_success_create)}
        format.json { render json: @admin_history, status: :created, location: @admin_history }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /histories/1
  # PUT /histories/1.json
  def update
    respond_to do |format|
      if @admin_history.update_attributes(history_params)
        format.html { redirect_to admin_histories_path, :notice=> @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @admin_history.destroy

    respond_to do |format|
      format.html { redirect_to admin_histories_path }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_history
    @admin_history = History.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def history_params
    params.require(:history).permit(:year, :title, :content)
  end  
end
