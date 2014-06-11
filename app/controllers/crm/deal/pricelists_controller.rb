class Crm::Deal::PricelistsController < ApplicationController
  before_action :set_crm_deal_pricelist, only: [:show, :edit, :update, :destroy]
  # GET /crm/deal/pricelists
  # GET /crm/deal/pricelists.json
  def index
    @crm_deal_pricelists = Crm::Deal::Pricelist.all
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_deal_pricelists }
    end
  end

  # GET /crm/deal/pricelists/1
  # GET /crm/deal/pricelists/1.json
  def show
  end

  # GET /crm/deal/pricelists/new
  # GET /crm/deal/pricelists/new.json
  def new
    deal = Crm::Deal.find(params[:deal_id])
    @crm_deal_pricelist = deal.pricelists.new
    @crm_deal_pricelist.content = Crm::Deal::Pricelist::MODEL
    @crm_deal_pricelist.user_id = current_user.id
    @crm_deal_pricelist.contact_id = deal.contact_id
    respond_to do |f|
      if @crm_deal_pricelist.save
        f.js
      end
    end
  end

  # GET /crm/deal/pricelists/1/edit
  def edit
  end

  # POST /crm/deal/pricelists
  # POST /crm/deal/pricelists.json
  def create
    @crm_deal_pricelist = Crm::Deal::Pricelist.new crm_deal_pricelist_params
    respond_to do |f|
      if @crm_deal_pricelist.save
        f.html { redirect_to @crm_deal_pricelist, notice: 'Pricelist was successfully created.' }
        f.json { render json: @crm_deal_pricelist, status: :created, location: @crm_deal_pricelist }
      else
        f.html { render action: "new" }
        f.json { render json: @crm_deal_pricelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crm/deal/pricelists/1
  # PUT /crm/deal/pricelists/1.json
  def update
    @crm_deal_pricelist.content = eval(params[:crm_deal_pricelist][:content])
    @crm_deal_pricelist.dealed = params[:crm_deal_pricelist][:dealed]

    respond_to do |f|
      #if @crm_deal_pricelist.update_attributes(params[:crm_deal_pricelist])
      if @crm_deal_pricelist.save
        f.js
      else
        f.html { render action: "edit" }
        f.json { render json: @crm_deal_pricelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/deal/pricelists/1
  # DELETE /crm/deal/pricelists/1.json
  def destroy
    @crm_deal_pricelist.destroy

    respond_to do |f|
      f.js
    end
  end

  private
    def set_crm_deal_pricelist
      @crm_deal_pricelist = Crm::Deal::Pricelist.find params[:id]
    end

    def crm_deal_pricelist_params
      params.require(:crm_deal_pricelist).permit(:contact_id, :content, :deal_id, :dealed, :user_id)
    end
end
