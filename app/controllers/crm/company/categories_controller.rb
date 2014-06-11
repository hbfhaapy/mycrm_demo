class Crm::Company::CategoriesController < ApplicationController
  load_and_authorize_resource :class => "Crm::Company::Category"
  before_action :set_crm_company_category, only: [:show, :edit, :update, :destroy]
  # GET /crm/categories
  # GET /crm/categories.json
  def index
    @crm_company_categories = Crm::Company::Category.all

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_company_categories }
    end
  end

  # GET /crm/categories/1
  # GET /crm/categories/1.json
  def show
  end

  # GET /crm/categories/new
  # GET /crm/categories/new.json
  def new
    @crm_company_category = Crm::Company::Category.new
    respond_to do |f|
      f.js { render :template => 'properties/new', locals: { property: @crm_company_category } }
    end
  end

  # GET /crm/categories/1/edit
  def edit
  end

  # POST /crm/categories
  # POST /crm/categories.json
  def create
    @crm_company_category = Crm::Company::Category.new crm_company_category_params
    respond_to do |f|
      if @crm_company_category.save
        f.js { render :template => 'properties/create', locals: { property: @crm_company_category } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_company_category.errors } }
      end
    end
  end

  # PUT /crm/categories/1
  # PUT /crm/categories/1.json
  def update
    respond_to do |f|
      if @crm_company_category.update crm_company_category_params
        f.js { render :template => 'properties/update', locals: { property: @crm_company_category } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_company_category.errors } }
      end
    end
  end

  # DELETE /crm/categories/1
  # DELETE /crm/categories/1.json
  def destroy
    @crm_company_category.destroy
    respond_to do |f|
      f.js { render :template => 'properties/destroy', locals: { property: @crm_company_category } }
    end
  end

  private
    def set_crm_company_category
      @crm_company_category = Crm::Company::Category.find params[:id]
    end

    def crm_company_category_params
      params.require(:crm_company_category).permit(:name)
    end
end