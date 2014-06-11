class Crm::Contact::StatusesController < ApplicationController
  load_and_authorize_resource :class => "Crm::Contact::Status"
  before_action :set_crm_contact_status, only: [:show, :edit, :update, :destroy]
  # GET /fm/billing/stages
  # GET /fm/billing/stages.json
  def index
    @crm_contact_statuses = Crm::Contact::Status.all
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_contact_statuses }
    end
  end

  # GET /fm/billing/stages/1
  # GET /fm/billing/stages/1.json
  def show
  end

  # GET /fm/billing/stages/new
  # GET /fm/billing/stages/new.json
  def new
    @crm_contact_status = Crm::Contact::Status.new
    respond_to do |f|
      f.js { render :template => 'properties/new', locals: { property: @crm_contact_status } }
    end
  end

  # GET /fm/billing/stages/1/edit
  def edit
  end

  # POST /fm/billing/stages
  # POST /fm/billing/stages.json
  def create
    @crm_contact_status = Crm::Contact::Status.new crm_contact_status_params
    respond_to do |f|
      if @crm_contact_status.save
        f.js { render :template => 'properties/create', locals: { property: @crm_contact_status } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_contact_status.errors } }
      end
    end
  end

  # PUT /fm/billing/stages/1
  # PUT /fm/billing/stages/1.json
  def update

    respond_to do |f|
      if @crm_contact_status.update crm_contact_status_params
        f.js { render :template => 'properties/update', locals: { property: @crm_contact_status } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_contact_status.errors } }
      end
    end
  end

  # DELETE /fm/billing/stages/1
  # DELETE /fm/billing/stages/1.json
  def destroy
    @crm_contact_status.destroy

    respond_to do |f|
      f.js { render :template => 'properties/destroy', locals: { property: @crm_contact_status } }
    end
  end

  private
    def set_crm_contact_status
      @crm_contact_status = Crm::Contact::Status.find params[:id]
    end

    def crm_contact_status_params
      params.require(:crm_contact_status).permit(:name)
    end
end
