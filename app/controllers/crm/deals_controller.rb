class Crm::DealsController < ApplicationController
  load_and_authorize_resource :class => "Crm::Deal"
  before_action :set_crm_deal, only: [:show, :edit, :update, :destroy]
  def advanced_search
    @search = Crm::Deal.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @crm_deals  = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)

    respond_with @crm_deals
  end

  # GET /crm/deals
  # GET /crm/deals.json
  def index
    @q = Crm::Deal.accessible_by(current_ability).includes(:status, :category, [:contact => :company]).order("created_at DESC").search(params[:q])
    @crm_deals = @q.result(:distinct => true).page(params[:page])

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_deals }
    end
  end

  # GET /crm/deals/1
  # GET /crm/deals/1.json
  def show
    @crm_deal = Crm::Deal.includes(:activities => [:status, :category, :person]).find(params[:id])
    @chart = @crm_deal.basic_line_chart
  end

  # GET /crm/deals/new
  # GET /crm/deals/new.json
  def new
    contact = Crm::Contact.find(params[:contact_id])
    @crm_deal = contact.deals.new
    respond_to do |f|
      f.js
    end
  end

  # GET /crm/deals/1/edit
  def edit
  end

  # POST /crm/deals
  # POST /crm/deals.json
  def create
    @crm_deal = Crm::Deal.new crm_deal_params
    @crm_deal.user_id = current_user.id
    respond_to do |f|
      if @crm_deal.save
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_deal.errors } }
      end
    end
  end

  # PUT /crm/deals/1
  # PUT /crm/deals/1.json
  def update
    respond_to do |f|
      if @crm_deal.update crm_deal_params
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_deal.errors } }
      end
    end
  end

  # DELETE /crm/deals/1
  # DELETE /crm/deals/1.json
  def destroy
    @crm_deal.destroy

    respond_to do |f|
      if params[:from] == "show"
        f.html { redirect_to crm_deals_url }
        f.json { head :no_content }
      else
        f.js
      end
    end
  end

  private
    def set_crm_deal
      @crm_deal = Crm::Deal.find params[:id]
    end

    def crm_deal_params
      params.require(:crm_deal).permit(:amount, :category_id, :company_id, :contact_id, :name, :status_id, :user_id, :activities_count, :time)
    end
end
