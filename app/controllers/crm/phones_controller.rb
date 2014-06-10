class Crm::PhonesController < ApplicationController
  before_action :set_crm_phone, only: [:show, :edit, :update, :destroy]

  # GET /crm/phones
  # GET /crm/phones.json
  def index
    @crm_phones = Crm::Phone.all
  end

  # GET /crm/phones/1
  # GET /crm/phones/1.json
  def show
  end

  # GET /crm/phones/new
  def new
    @crm_phone = Crm::Phone.new
  end

  # GET /crm/phones/1/edit
  def edit
  end

  # POST /crm/phones
  # POST /crm/phones.json
  def create
    @crm_phone = Crm::Phone.new(crm_phone_params)

    respond_to do |format|
      if @crm_phone.save
        format.html { redirect_to @crm_phone, notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @crm_phone }
      else
        format.html { render :new }
        format.json { render json: @crm_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crm/phones/1
  # PATCH/PUT /crm/phones/1.json
  def update
    respond_to do |format|
      if @crm_phone.update(crm_phone_params)
        format.html { redirect_to @crm_phone, notice: 'Phone was successfully updated.' }
        format.json { render :show, status: :ok, location: @crm_phone }
      else
        format.html { render :edit }
        format.json { render json: @crm_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/phones/1
  # DELETE /crm/phones/1.json
  def destroy
    @crm_phone.destroy
    respond_to do |format|
      format.html { redirect_to crm_phones_url, notice: 'Phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crm_phone
      @crm_phone = Crm::Phone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crm_phone_params
      params.require(:crm_phone).permit(:klass_id, :number, :phoneable_id, :phoneable_type)
    end
end
