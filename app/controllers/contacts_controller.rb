class ContactsController < ApplicationController
  before_action :check_user_signed_in

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = current_user.contacts.page(params[:page]).per(1)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_to @contact, notice: 'Tạo danh bạ thành công'
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Sửa bài thành công'
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    contact = Contact.find(params[:id])
    contact.destroy

    redirect_to contacts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :phone, :address, :note, :avatar, :user_id)
    end
end
