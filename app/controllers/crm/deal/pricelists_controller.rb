class Crm::Deal::PricelistsController < ApplicationController
  before_action :set_crm_deal_pricelist, only: [:show, :edit, :update, :destroy]

  # GET /crm/deal/pricelists
  # GET /crm/deal/pricelists.json
  def index
    @crm_deal_pricelists = Crm::Deal::Pricelist.all
  end

  # GET /crm/deal/pricelists/1
  # GET /crm/deal/pricelists/1.json
  def show
  end

  # GET /crm/deal/pricelists/new
  def new
    @crm_deal_pricelist = Crm::Deal::Pricelist.new
  end

  # GET /crm/deal/pricelists/1/edit
  def edit
  end

  # POST /crm/deal/pricelists
  # POST /crm/deal/pricelists.json
  def create
    @crm_deal_pricelist = Crm::Deal::Pricelist.new(crm_deal_pricelist_params)

    respond_to do |format|
      if @crm_deal_pricelist.save
        format.html { redirect_to @crm_deal_pricelist, notice: 'Pricelist was successfully created.' }
        format.json { render :show, status: :created, location: @crm_deal_pricelist }
      else
        format.html { render :new }
        format.json { render json: @crm_deal_pricelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crm/deal/pricelists/1
  # PATCH/PUT /crm/deal/pricelists/1.json
  def update
    respond_to do |format|
      if @crm_deal_pricelist.update(crm_deal_pricelist_params)
        format.html { redirect_to @crm_deal_pricelist, notice: 'Pricelist was successfully updated.' }
        format.json { render :show, status: :ok, location: @crm_deal_pricelist }
      else
        format.html { render :edit }
        format.json { render json: @crm_deal_pricelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/deal/pricelists/1
  # DELETE /crm/deal/pricelists/1.json
  def destroy
    @crm_deal_pricelist.destroy
    respond_to do |format|
      format.html { redirect_to crm_deal_pricelists_url, notice: 'Pricelist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crm_deal_pricelist
      @crm_deal_pricelist = Crm::Deal::Pricelist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crm_deal_pricelist_params
      params.require(:crm_deal_pricelist).permit(:content, :dealed, :deal_id, :user_id, :contact_id)
    end
end
