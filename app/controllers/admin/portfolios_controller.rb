# encoding: utf-8

class Admin::PortfoliosController < Admin::AdminController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]   
  
  def initialize(*params)
    super(*params)
    @controller_name='수정이 요리'
  end
   
  # GET /portfolios
  # GET /portfolios.json
  def index
    @admin_portfolios = Portfolio.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_portfolios }
    end
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_portfolio }
    end
  end

  # GET /portfolios/new
  # GET /portfolios/new.json
  def new
    @admin_portfolio = Portfolio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_portfolio }
    end
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @admin_portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @admin_portfolio.save
        format.html { redirect_to admin_portfolios_url, notice: @controller_name +t(:message_success_create) }
        format.json { render json: @admin_portfolio, status: :created, location: @admin_portfolio }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /portfolios/1
  # PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @admin_portfolio.update_attributes(portfolio_params)
        format.html { redirect_to admin_portfolios_url, notice: @controller_name +t(:message_success_update) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @admin_portfolio.destroy

    respond_to do |format|
      format.html { redirect_to admin_portfolios_url }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio
    @admin_portfolio = Portfolio.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def portfolio_params
    params.require(:portfolio).permit(:id, :url, :title, :description, :photo)
  end  
end
