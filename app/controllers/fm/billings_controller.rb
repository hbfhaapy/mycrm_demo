
class Fm::BillingsController < ApplicationController
  load_and_authorize_resource :class => "Fm::Billing"
  before_action :set_fm_billing, only: [:show, :edit, :update, :destroy]

  def advanced_search
    @search = Fm::Billing.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @cm_contracts  = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)

    respond_with @cm_contracts
  end

  # GET /fm/billings
  # GET /fm/billings.json
  def index
    @q = Fm::Billing.accessible_by(current_ability).includes(:company, :manager, :collection => [:contract => :plan]).order("time DESC").search(params[:q])
    @fm_billings = @q.result(:distinct => true).page(params[:page])

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @fm_billings }
    end
  end

  # GET /fm/billings/1
  # GET /fm/billings/1.json
  def show
  end

  # GET /fm/billings/new
  # GET /fm/billings/new.json
  def new
    collection = Cm::Collection.find(params[:collection_id])
    @fm_billing = collection.billings.new
    @fm_billing.manager_id = current_user.id
    @fm_billing.company_id = @fm_billing.collection.contract.company_id

    respond_to do |f|
      f.js
    end
  end

  # GET /fm/billings/1/edit
  def edit
  end

  # POST /fm/billings
  # POST /fm/billings.json
  def create
    @fm_billing = Fm::Billing.new fm_billing_params
    @fm_billing.user_id = current_user.id

    respond_to do |f|
      if @fm_billing.save
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @fm_billing.errors } }
      end
    end
  end

  # PUT /fm/billings/1
  # PUT /fm/billings/1.json
  def update
    respond_to do |f|
      if @fm_billing.update fm_billing_params
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @fm_billing.errors } }
      end
    end
  end

  # DELETE /fm/billings/1
  # DELETE /fm/billings/1.json
  def destroy
    @fm_billng.destroy

    respond_to do |f|
      f.js
    end
  end

  private
    def set_fm_billing
      @fm_billing = Fm::Billing.find params[:id]
    end

    def fm_billing_params
      params.require(:fm_billing).permit(:amount, :collection_id, :manager_id, :time, :user_id, :company_id)
    end
end
