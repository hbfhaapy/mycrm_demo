class Crm::DealsController < ApplicationController
  before_action :set_crm_deal, only: [:show, :edit, :update, :destroy]

  # GET /crm/deals
  # GET /crm/deals.json
  def index
    @crm_deals = Crm::Deal.all
  end

  # GET /crm/deals/1
  # GET /crm/deals/1.json
  def show
  end

  # GET /crm/deals/new
  def new
    @crm_deal = Crm::Deal.new
  end

  # GET /crm/deals/1/edit
  def edit
  end

  # POST /crm/deals
  # POST /crm/deals.json
  def create
    @crm_deal = Crm::Deal.new(crm_deal_params)

    respond_to do |format|
      if @crm_deal.save
        format.html { redirect_to @crm_deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @crm_deal }
      else
        format.html { render :new }
        format.json { render json: @crm_deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crm/deals/1
  # PATCH/PUT /crm/deals/1.json
  def update
    respond_to do |format|
      if @crm_deal.update(crm_deal_params)
        format.html { redirect_to @crm_deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @crm_deal }
      else
        format.html { render :edit }
        format.json { render json: @crm_deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/deals/1
  # DELETE /crm/deals/1.json
  def destroy
    @crm_deal.destroy
    respond_to do |format|
      format.html { redirect_to crm_deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crm_deal
      @crm_deal = Crm::Deal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crm_deal_params
      params.require(:crm_deal).permit(:name, :status_id, :category_id, :amount, :company_id, :contact_id, :user_id, :time)
    end
end
