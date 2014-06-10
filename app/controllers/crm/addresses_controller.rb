class Crm::AddressesController < ApplicationController
  before_action :set_crm_address, only: [:show, :edit, :update, :destroy]

  # GET /crm/addresses
  # GET /crm/addresses.json
  def index
    @crm_addresses = Crm::Address.all
  end

  # GET /crm/addresses/1
  # GET /crm/addresses/1.json
  def show
  end

  # GET /crm/addresses/new
  def new
    @crm_address = Crm::Address.new
  end

  # GET /crm/addresses/1/edit
  def edit
  end

  # POST /crm/addresses
  # POST /crm/addresses.json
  def create
    @crm_address = Crm::Address.new(crm_address_params)

    respond_to do |format|
      if @crm_address.save
        format.html { redirect_to @crm_address, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @crm_address }
      else
        format.html { render :new }
        format.json { render json: @crm_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crm/addresses/1
  # PATCH/PUT /crm/addresses/1.json
  def update
    respond_to do |format|
      if @crm_address.update(crm_address_params)
        format.html { redirect_to @crm_address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @crm_address }
      else
        format.html { render :edit }
        format.json { render json: @crm_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/addresses/1
  # DELETE /crm/addresses/1.json
  def destroy
    @crm_address.destroy
    respond_to do |format|
      format.html { redirect_to crm_addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crm_address
      @crm_address = Crm::Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crm_address_params
      params.require(:crm_address).permit(:content, :addressable_id, :addressable_type)
    end
end
