class Crm::Activity::StatusesController < ApplicationController
  load_and_authorize_resource :class => "Crm::Activity::Status"
  before_action :set_crm_activity_status, only: [:show, :edit, :update, :destroy]
  # GET /crm/activity/statuses
  # GET /crm/activity/statuses.json
  def index
    @crm_activity_statuses = Crm::Activity::Status.all
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_activity_statuses }
    end
  end

  # GET /crm/activity/statuses/1
  # GET /crm/activity/statuses/1.json
  def show
  end

  # GET /crm/activity/statuses/new
  # GET /crm/activity/statuses/new.json
  def new
    @crm_activity_status = Crm::Activity::Status.new
    respond_to do |f|
      f.js { render :template => 'properties/new', locals: { property: @crm_activity_status } }
    end
  end

  # GET /crm/activity/statuses/1/edit
  def edit
  end

  # POST /crm/activity/statuses
  # POST /crm/activity/statuses.json
  def create
    @crm_activity_status = Crm::Activity::Status.new crm_activity_status_params
    respond_to do |f|
      if @crm_activity_status.save
        f.js { render :template => 'properties/create', locals: { property: @crm_activity_status } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_activity_status.errors } }
      end
    end
  end

  # PUT /crm/activity/statuses/1
  # PUT /crm/activity/statuses/1.json
  def update

    respond_to do |f|
      if @crm_activity_status.update crm_activity_status_params
        f.js { render :template => 'properties/update', locals: { property: @crm_activity_status } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_activity_status.errors } }
      end
    end
  end

  # DELETE /crm/activity/statuses/1
  # DELETE /crm/activity/statuses/1.json
  def destroy
    @crm_activity_status.destroy
    respond_to do |f|
      f.js { render :template => 'properties/destroy', locals: { property: @crm_activity_status } }
    end
  end

  private
    def set_crm_activity_status
      @crm_activity_status = Crm::Activity::Status.find params[:id]
    end

    def crm_activity_status_params
      params.require(:crm_activity_status_params).permit(:name)
    end
end
