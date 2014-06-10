class Crm::ContactsController < ApplicationController
  before_action :set_crm_contact, only: [:show, :edit, :update, :destroy]

  # GET /crm/contacts
  # GET /crm/contacts.json
  def index
    @crm_contacts = Crm::Contact.all
  end

  # GET /crm/contacts/1
  # GET /crm/contacts/1.json
  def show
  end

  # GET /crm/contacts/new
  def new
    @crm_contact = Crm::Contact.new
  end

  # GET /crm/contacts/1/edit
  def edit
  end

  # POST /crm/contacts
  # POST /crm/contacts.json
  def create
    @crm_contact = Crm::Contact.new(crm_contact_params)

    respond_to do |format|
      if @crm_contact.save
        format.html { redirect_to @crm_contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @crm_contact }
      else
        format.html { render :new }
        format.json { render json: @crm_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crm/contacts/1
  # PATCH/PUT /crm/contacts/1.json
  def update
    respond_to do |format|
      if @crm_contact.update(crm_contact_params)
        format.html { redirect_to @crm_contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @crm_contact }
      else
        format.html { render :edit }
        format.json { render json: @crm_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/contacts/1
  # DELETE /crm/contacts/1.json
  def destroy
    @crm_contact.destroy
    respond_to do |format|
      format.html { redirect_to crm_contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crm_contact
      @crm_contact = Crm::Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crm_contact_params
      params.require(:crm_contact).permit(:name, :category_id, :company_id, :user_id, :mail, :qq, :msn, :job, :note, :image, :status_id)
    end
end
