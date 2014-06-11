class Crm::Deal::CategoriesController < ApplicationController
  load_and_authorize_resource :class => "Crm::Deal::Category"
  before_action :set_crm_deal_category, only: [:show, :edit, :update, :destroy]
  # GET /crm/deal/categories
  # GET /crm/deal/categories.json
  def index
    @crm_deal_categories = Crm::Deal::Category.all
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_deal_categories }
    end
  end

  # GET /crm/deal/categories/1
  # GET /crm/deal/categories/1.json
  def show
    respond_to do |f|
      f.html # show.html.erb
      f.json { render json: @crm_deal_category }
    end
  end

  # GET /crm/deal/categories/new
  # GET /crm/deal/categories/new.json
  def new
    @crm_deal_category = Crm::Deal::Category.new
    respond_to do |f|
      f.js { render :template => 'properties/new', locals: { property: @crm_deal_category } }
    end
  end

  # GET /crm/deal/categories/1/edit
  def edit
  end

  # POST /crm/deal/categories
  # POST /crm/deal/categories.json
  def create
    @crm_deal_category = Crm::Deal::Category.new crm_deal_category_params
    respond_to do |f|
      if @crm_deal_category.save
        f.js { render :template => 'properties/create', locals: { property: @crm_deal_category } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_deal_category.errors } }
      end
    end
  end

  # PUT /crm/deal/categories/1
  # PUT /crm/deal/categories/1.json
  def update
    respond_to do |f|
      if @crm_deal_category.update crm_deal_category_params
        f.js { render :template => 'properties/update', locals: { property: @crm_deal_category } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_deal_category.errors } }
      end
    end
  end

  # DELETE /crm/deal/categories/1
  # DELETE /crm/deal/categories/1.json
  def destroy
    @crm_deal_category.destroy

    respond_to do |f|
      f.js { render :template => 'properties/destroy', locals: { property: @crm_deal_category } }
    end
  end

  private
    def set_crm_deal_category
      @crm_deal_category = Crm::Deal::Category.find params[:id]
    end

    def crm_deal_category_params
      params.require(:crm_deal_category).permit(:name)
    end
end
