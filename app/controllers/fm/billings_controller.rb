class Fm::BillingsController < ApplicationController
  before_action :set_fm_billing, only: [:show, :edit, :update, :destroy]

  # GET /fm/billings
  # GET /fm/billings.json
  def index
    @fm_billings = Fm::Billing.all
  end

  # GET /fm/billings/1
  # GET /fm/billings/1.json
  def show
  end

  # GET /fm/billings/new
  def new
    @fm_billing = Fm::Billing.new
  end

  # GET /fm/billings/1/edit
  def edit
  end

  # POST /fm/billings
  # POST /fm/billings.json
  def create
    @fm_billing = Fm::Billing.new(fm_billing_params)

    respond_to do |format|
      if @fm_billing.save
        format.html { redirect_to @fm_billing, notice: 'Billing was successfully created.' }
        format.json { render :show, status: :created, location: @fm_billing }
      else
        format.html { render :new }
        format.json { render json: @fm_billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fm/billings/1
  # PATCH/PUT /fm/billings/1.json
  def update
    respond_to do |format|
      if @fm_billing.update(fm_billing_params)
        format.html { redirect_to @fm_billing, notice: 'Billing was successfully updated.' }
        format.json { render :show, status: :ok, location: @fm_billing }
      else
        format.html { render :edit }
        format.json { render json: @fm_billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fm/billings/1
  # DELETE /fm/billings/1.json
  def destroy
    @fm_billing.destroy
    respond_to do |format|
      format.html { redirect_to fm_billings_url, notice: 'Billing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fm_billing
      @fm_billing = Fm::Billing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fm_billing_params
      params.require(:fm_billing).permit(:amount, :time, :manager_id, :company_id, :collection_id, :user_id)
    end
end
