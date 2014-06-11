class Cm::ContractsController < ApplicationController
  load_and_authorize_resource :class => "Cm::Contract"
  before_action :set_cm_contract, only: [:show, :edit, :update, :destroy]

  def advanced_search
    @search = Cm::Contract.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @cm_contracts  = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)

    respond_with @cm_contracts
  end

  # GET /cm/contracts
  # GET /cm/contracts.json
  def index
    @q = Cm::Contract.accessible_by(current_ability).includes(:company, :agent, :status, :plan).order("created_at DESC").search(params[:q])
    @cm_contracts = @q.result(:distinct => true).page(params[:page])

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @cm_contracts }
    end
  end

  # GET /cm/contracts/1
  # GET /cm/contracts/1.json
  def show
    @cm_contract = Cm::Contract.includes(:collections => :contract).find(params[:id])
  end

  # GET /cm/contracts/new
  # GET /cm/contracts/new.json
  def new
    plan = Pm::Plan.find(params[:plan_id])
    @cm_contract = plan.contracts.new
    @cm_contract.company_id = plan.deal.company_id
    @cm_contract.agent_id = plan.deal.user_id

    respond_to do |f|
      f.html # new.html.erb
      f.json { render json: @cm_contract }
    end
  end

  # GET /cm/contracts/1/edit
  def edit
  end

  # POST /cm/contracts
  # POST /cm/contracts.json
  def create
    @cm_contract = Cm::Contract.new cm_contract_params
    @cm_contract.user_id = current_user.id

    respond_to do |f|
      if @cm_contract.save
        f.html { redirect_to @cm_contract, notice: '合同已成功创建' }
        f.json { render json: @cm_contract, status: :created, location: @cm_contract }
      else
        f.html { render action: "new" }
        f.json { render json: @cm_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cm/contracts/1
  # PUT /cm/contracts/1.json
  def update
    respond_to do |f|
      if @cm_contract.update cm_contract_params
        f.html { redirect_to @cm_contract, notice: '合同已成功更新' }
        f.json { head :no_content }
      else
        f.html { render action: "edit" }
        f.json { render json: @cm_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cm/contracts/1
  # DELETE /cm/contracts/1.json
  def destroy
    @cm_contact.destroy
    respond_to do |f|
      f.html { redirect_to cm_contracts_url }
      f.json { head :no_content }
    end
  end

  private
    def set_cm_contract
      @cm_contract = Cm::Contract.find params[:id]
    end

    def cm_contract_params
      params.require(:cm_contract).permit(:actual_amount, :agent_id, :amount, :company_id, :ended_at, :name, :plan_id, :signed_at, :started_at, :status_id, :user_id)
    end
end
