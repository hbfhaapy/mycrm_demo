class Crm::Deal::StatusesController < ApplicationController
  load_and_authorize_resource :class => "Crm::Deal::Status"
  before_action :set_crm_deal_status, only: [:show, :edit, :update, :destroy]
  # GET /crm/deal/statuses
  # GET /crm/deal/statuses.json
  def index
    @crm_deal_statuses = Crm::Deal::Status.all

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_deal_statuses }
    end
  end

  # GET /crm/deal/statuses/1
  # GET /crm/deal/statuses/1.json
  def show
  end

  # GET /crm/deal/statuses/new
  # GET /crm/deal/statuses/new.json
  def new
    @crm_deal_status = Crm::Deal::Status.new
    respond_to do |f|
      f.js { render :template => 'properties/new', locals: { property: @crm_deal_status } }
    end
  end

  # GET /crm/deal/statuses/1/edit
  def edit
  end

  # POST /crm/deal/statuses
  # POST /crm/deal/statuses.json
  def create
    @crm_deal_status = Crm::Deal::Status.new crm_deal_status_params
    respond_to do |f|
      if @crm_deal_status.save
        f.js { render :template => 'properties/create', locals: { property: @crm_deal_status } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_deal_status.errors } }
      end
    end
  end

  # PUT /crm/deal/statuses/1
  # PUT /crm/deal/statuses/1.json
  def update
    respond_to do |f|
      if @crm_deal_status.update crm_deal_status_params
        f.js { render :template => 'properties/update', locals: { property: @crm_deal_status } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_deal_status.errors } }
      end
    end
  end

  # DELETE /crm/deal/statuses/1
  # DELETE /crm/deal/statuses/1.json
  def destroy
    @crm_deal_status.destroy

    respond_to do |f|
      f.js { render :template => 'properties/destroy', locals: { property: @crm_deal_status } }
    end
  end

  private
    def set_crm_deal_status
      @crm_deal_status = Crm::Deal::Status.find params[:id]
    end

    def crm_deal_status_params
      params.require(:crm_deal_status).permit(:name)
    end
end
