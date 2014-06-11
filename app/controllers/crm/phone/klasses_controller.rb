class Crm::Phone::KlassesController < ApplicationController
  load_and_authorize_resource :class => "Crm::Phone::Klass"
  before_action :set_crm_phone_klass, only: [:show, :edit, :update, :destroy]
  # GET /crm/phone/klasses
  # GET /crm/phone/klasses.json
  def index
    @crm_phone_klasses = Crm::Phone::Klass.all

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_phone_klasses }
    end
  end

  # GET /crm/phone/klasses/1
  # GET /crm/phone/klasses/1.json
  def show
  end

  # GET /crm/phone/klasses/new
  # GET /crm/phone/klasses/new.json
  def new
    @crm_phone_klass = Crm::Phone::Klass.new

    respond_to do |f|
      f.js { render :template => 'properties/new', locals: { property: @crm_phone_klass } }
    end
  end

  # GET /crm/phone/klasses/1/edit
  def edit
  end

  # POST /crm/phone/klasses
  # POST /crm/phone/klasses.json
  def create
    @crm_phone_klass = Crm::Phone::Klass.new crm_phone_klass_params
    respond_to do |f|
      if @crm_phone_klass.save
        f.js { render :template => 'properties/create', locals: { property: @crm_phone_klass } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_phone_klass.errors } }
      end
    end
  end

  # PUT /crm/phone/klasses/1
  # PUT /crm/phone/klasses/1.json
  def update
    respond_to do |f|
      if @crm_phone_klass.update crm_phone_klass_params
        f.js { render :template => 'properties/update', locals: { property: @crm_phone_klass } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_phone_klass.errors } }
      end
    end
  end

  # DELETE /crm/phone/klasses/1
  # DELETE /crm/phone/klasses/1.json
  def destroy
    @crm_phone_klass.destroy

    respond_to do |f|
      f.js { render :template => 'properties/destroy', locals: { property: @crm_phone_klass } }
    end
  end

  private
    def set_crm_phone_klass
      @crm_phone_klass = Crm::Phone::Klass.find params[:id]
    end

    def crm_phone_klass_params
      params.require(:crm_phone_klass).permit(:name)
    end
end
