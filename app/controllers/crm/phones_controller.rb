class Crm::PhonesController < ApplicationController
  before_action :set_crm_phone, only: [:show, :edit, :update, :destroy]
  # GET /crm/phones
  # GET /crm/phones.json
  def index
    @crm_phones = Crm::Phone.all
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_phones }
    end
  end

  # GET /crm/phones/1
  # GET /crm/phones/1.json
  def show
  end

  # GET /crm/phones/new
  # GET /crm/phones/new.json
  def new
    @crm_phone = Crm::Phone.new
    respond_to do |f|
      f.html # new.html.erb
      f.json { render json: @crm_phone }
    end
  end

  # GET /crm/phones/1/edit
  def edit
  end

  # POST /crm/phones
  # POST /crm/phones.json
  def create
    @crm_phone = Crm::Phone.new crm_phone_params
    respond_to do |f|
      if @crm_phone.save
        f.html { redirect_to @crm_phone, notice: 'Phone was successfully created.' }
        f.json { render json: @crm_phone, status: :created, location: @crm_phone }
      else
        f.html { render action: "new" }
        f.json { render json: @crm_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crm/phones/1
  # PUT /crm/phones/1.json
  def update
    respond_to do |f|
      if @crm_phone.update crm_phone_params
        f.html { redirect_to @crm_phone, notice: 'Phone was successfully updated.' }
        f.json { head :no_content }
      else
        f.html { render action: "edit" }
        f.json { render json: @crm_phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/phones/1
  # DELETE /crm/phones/1.json
  def destroy
    @crm_phone.destroy

    respond_to do |f|
      f.html { redirect_to crm_phones_url }
      f.json { head :no_content }
    end
  end

  private
    def set_crm_phone
      @crm_phone = Crm::Phone.find params[:id]
    end

    def crm_phone_params
      params.require(:crm_phone).permit(:number, :klass_id, :phoneable_id, :phoneable_type)
    end
end
