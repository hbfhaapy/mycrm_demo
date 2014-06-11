class Crm::AddressesController < ApplicationController
  before_action :set_crm_address, only: [:show, :edit, :update, :destroy]
  # GET /crm/addresses
  # GET /crm/addresses.json
  def index
    @crm_addresses = Crm::Address.all
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_addresses }
    end
  end

  # GET /crm/addresses/1
  # GET /crm/addresses/1.json
  def show
  end

  # GET /crm/addresses/new
  # GET /crm/addresses/new.json
  def new
    @crm_address = Crm::Address.new

    respond_to do |f|
      f.html # new.html.erb
      f.json { render json: @crm_address }
    end
  end

  # GET /crm/addresses/1/edit
  def edit
  end

  # POST /crm/addresses
  # POST /crm/addresses.json
  def create
    @crm_address = Crm::Address.new crm_address_params

    respond_to do |f|
      if @crm_address.save
        f.html { redirect_to @crm_address, notice: 'Address was successfully created.' }
        f.json { render json: @crm_address, status: :created, location: @crm_address }
      else
        f.html { render action: "new" }
        f.json { render json: @crm_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crm/addresses/1
  # PUT /crm/addresses/1.json
  def update
    respond_to do |f|
      if @crm_address.update crm_address_params
        f.html { redirect_to @crm_address, notice: 'Address was successfully updated.' }
        f.json { head :no_content }
      else
        f.html { render action: "edit" }
        f.json { render json: @crm_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/addresses/1
  # DELETE /crm/addresses/1.json
  def destroy
    @crm_address.destroy

    respond_to do |f|
      f.html { redirect_to crm_addresses_url }
      f.json { head :no_content }
    end
  end

  private
    def set_crm_address
      @crm_address = Crm::Address.find params[:id]
    end

    def crm_address_params
      params.require(:crm_address).permit(:content, :addressable_id, :addressable_type)
    end
end
