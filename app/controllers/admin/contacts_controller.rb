# encoding: utf-8

class Admin::ContactsController < Admin::AdminController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]  
  
  def initialize(*params)
    super(*params)
    @controller_name='수정이 요리'
  end
   
  # GET /contacts
  # GET /contacts.json
  def index
    @admin_contacts = Contact.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @admin_contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_contact }
    end
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @admin_contact = Contact.new(contact_params)

    respond_to do |format|
      if @admin_contact.save
        format.html { redirect_to @admin_contact, notice: @controller_name +t(:message_success_create)}
        format.json { render json: @admin_contact, status: :created, location: @admin_contact }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    respond_to do |format|
      if @admin_contact.update_attributes(contact_params)
        format.html { redirect_to @admin_contact, notice: @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @admin_contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @admin_contact = Contact.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:id, :name, :phone, :email, :title)
  end  
end
