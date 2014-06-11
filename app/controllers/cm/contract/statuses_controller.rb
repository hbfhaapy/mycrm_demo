class Cm::Contract::StatusesController < ApplicationController
  load_and_authorize_resource :class => "Cm::Contract::Status"
  before_action :set_cm_contract_status, only: [:show, :edit, :update, :destroy]

  # GET /crm/deal/statuses
  # GET /crm/deal/statuses.json
  def index
    @cm_contract_statuses = Cm::Contract::Status.all

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @cm_contract_statuses }
    end
  end

  # GET /crm/deal/statuses/1
  # GET /crm/deal/statuses/1.json
  def show
  end

  # GET /crm/deal/statuses/new
  # GET /crm/deal/statuses/new.json
  def new
    @cm_contract_status = Cm::Contract::Status.new

    respond_to do |f|
      f.js { render :template => 'properties/new', locals: { property: @cm_contract_status } }
    end
  end

  # GET /crm/deal/statuses/1/edit
  def edit
  end

  # POST /crm/deal/statuses
  # POST /crm/deal/statuses.json
  def create
    @cm_contract_status = Cm::Contract::Status.new cm_contract_status_params
    respond_to do |f|
      if @cm_contract_status.save
        f.js { render :template => 'properties/create', locals: { property: @cm_contract_status } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @cm_contract_status.errors } }
      end
    end
  end

  # PUT /crm/deal/statuses/1
  # PUT /crm/deal/statuses/1.json
  def update
    respond_to do |f|
      if @cm_contract_status.update cm_contract_status_params
        f.js { render :template => 'properties/update', locals: { property: @cm_contract_status } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @cm_contract_status.errors } }
      end
    end
  end

  # DELETE /crm/deal/statuses/1
  # DELETE /crm/deal/statuses/1.json
  def destroy
    respond_to do |f|
      if (@cm_contract_status.destroy rescue false)
        f.js { render :template => 'properties/destroy', locals: { property: @cm_contract_status } }
      else
        f.js { render :template => 'layouts/canot_destroy', locals: { text: "无法删除有关联其他数据的记录" } }
      end
    end
  end

  private
    def set_cm_contract_status
      @cm_contract_status = Cm::Contract::Status.find params[:id]
    end

    def cm_contract_status_params
      params.require(:cm_contract_status).permit(:name)
    end
end
