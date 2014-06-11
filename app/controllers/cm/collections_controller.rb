class Cm::CollectionsController < ApplicationController
  load_and_authorize_resource :class => "Cm::Collection"
  before_action :set_cm_collection, only: [:show, :edit, :update, :destroy]

  def advanced_search
    @search = Cm::Collection.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @cm_collections  = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)

    respond_with @cm_collections
  end

  # GET /cm/collections
  # GET /cm/collections.json
  def index
    @q = Cm::Collection.accessible_by(current_ability).includes(:contract => [:company, :plan]).order("created_at DESC").search(params[:q])
    @cm_collections = @q.result(:distinct => true).page(params[:page])

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @cm_collections }
    end
  end

  # GET /cm/collections/1
  # GET /cm/collections/1.json
  def show
    @cm_collection = Cm::Collection.includes(:incomes => :company, :billings => :manager).find(params[:id])
  end

  # GET /cm/collections/new
  # GET /cm/collections/new.json
  def new
    contract = Cm::Contract.find(params[:contract_id])
    @cm_collection = contract.collections.new
    respond_to do |f|
      f.js
    end
  end

  # GET /cm/collections/1/edit
  def edit
  end

  # POST /cm/collections
  # POST /cm/collections.json
  def create
    @cm_collection = Cm::Collection.new cm_collection_params
    @cm_collection.user_id = current_user.id

    respond_to do |f|
      if @cm_collection.save
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @cm_collection.errors } }
      end
    end
  end

  # PUT /cm/collections/1
  # PUT /cm/collections/1.json
  def update
    respond_to do |f|
      if @cm_collection.update cm_collection_params
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @cm_collection.errors } }
      end
    end
  end

  # DELETE /cm/collections/1
  # DELETE /cm/collections/1.json
  def destroy
    @cm_collction.destroy

    respond_to do |f|
      f.js
    end
  end

  private
    def set_cm_collection
      @cm_collection = Cm::Collection.find params[:id]
    end

    def cm_collection_params
      params.require(:cm_collection).permit(:contract_id, :name, :percent, :user_id, :time)
    end
end
