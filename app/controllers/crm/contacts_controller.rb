class Crm::ContactsController < ApplicationController
  load_and_authorize_resource :class => "Crm::Contact"
  before_action :set_crm_contact, only: [:show, :edit, :update, :destroy]
  def advanced_search
    @search = Crm::Contact.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @crm_contacts  = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)

    respond_with @crm_contacts
  end

  # GET /crm/contacts
  # GET /crm/contacts.json
  def index
    @q = Crm::Contact.accessible_by(current_ability).includes(:status, :category, :company, :phones => :klass).order("updated_at DESC").search(params[:q])
    @crm_contacts = @q.result(:distinct => true).page(params[:page])

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_contacts }
    end
  end

  # GET /crm/contacts/1
  # GET /crm/contacts/1.json
  def show
    @crm_contact = Crm::Contact.includes([:phones => :klass], :status, :category, :deals => [:status, :category], :activities => [:status, :category, :person]).find(params[:id])
    @chart = @crm_contact.basic_line_chart
  end

  # GET /crm/contacts/new
  # GET /crm/contacts/new.json
  def new
    @crm_contact = Crm::Contact.new
    phones = @crm_contact.phones.new
    addresses = @crm_contact.addresses.new
    respond_to do |f|
      f.html # new.html.erb
      f.json { render json: @crm_contact }
    end
  end

  # GET /crm/contacts/1/edit
  def edit
  end

  # POST /crm/contacts
  # POST /crm/contacts.json
  def create
    @crm_contact = Crm::Contact.new crm_contact_params
    @crm_contact.user_id = current_user.id
    respond_to do |f|
      if @crm_contact.save
        f.html { redirect_to @crm_contact, notice: '联系人已成功创建' }
        f.json { render json: @crm_contact, status: :created, location: @crm_contact }
      else
        f.html { render action: "new" }
        f.json { render json: @crm_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crm/contacts/1
  # PUT /crm/contacts/1.json
  def update
    respond_to do |f|
      if @crm_contact.update crm_contact_params
        f.html { redirect_to @crm_contact, notice: '联系人已成功更新' }
        f.json { head :no_content }
      else
        f.html { render action: "edit" }
        f.json { render json: @crm_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/contacts/1
  # DELETE /crm/contacts/1.json
  def destroy
    @crm_contact.destroy
    respond_to do |f|
      f.html { redirect_to crm_contacts_url }
      f.json { head :no_content }
    end
  end

  private
    def set_crm_contact
      @crm_contact = Crm::Contact.find params[:id]
    end

    def crm_contact_params
      params.require(:crm_contact).permit(:category_id, :company_id, :image, :job, :mail, :msn, :name, :note, :qq, :deals_count, :phones_attributes, :addresses_attributes, :status_id)
    end
end
