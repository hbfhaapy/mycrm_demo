class Cm::ContractsController < ApplicationController
  before_action :set_cm_contract, only: [:show, :edit, :update, :destroy]

  # GET /cm/contracts
  # GET /cm/contracts.json
  def index
    @cm_contracts = Cm::Contract.all
  end

  # GET /cm/contracts/1
  # GET /cm/contracts/1.json
  def show
  end

  # GET /cm/contracts/new
  def new
    @cm_contract = Cm::Contract.new
  end

  # GET /cm/contracts/1/edit
  def edit
  end

  # POST /cm/contracts
  # POST /cm/contracts.json
  def create
    @cm_contract = Cm::Contract.new(cm_contract_params)

    respond_to do |format|
      if @cm_contract.save
        format.html { redirect_to @cm_contract, notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @cm_contract }
      else
        format.html { render :new }
        format.json { render json: @cm_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cm/contracts/1
  # PATCH/PUT /cm/contracts/1.json
  def update
    respond_to do |format|
      if @cm_contract.update(cm_contract_params)
        format.html { redirect_to @cm_contract, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @cm_contract }
      else
        format.html { render :edit }
        format.json { render json: @cm_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cm/contracts/1
  # DELETE /cm/contracts/1.json
  def destroy
    @cm_contract.destroy
    respond_to do |format|
      format.html { redirect_to cm_contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cm_contract
      @cm_contract = Cm::Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cm_contract_params
      params.require(:cm_contract).permit(:name, :amount, :actual_amount, :status_id, :agent_id, :signed_at, :started_at, :company_id, :plan_id, :user_id)
    end
end
