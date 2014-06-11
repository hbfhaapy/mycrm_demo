class Crm::Activity::CategoriesController < ApplicationController
  load_and_authorize_resource :class => "Crm::Activity::Category"
  before_action :set_crm_activity_category, only: [:show, :edit, :update, :destroy]
  # GET /crm/activity/categories
  # GET /crm/activity/categories.json
  def index
    @crm_activity_categories = Crm::Activity::Category.all
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_activity_categories }
    end
  end

  # GET /crm/activity/categories/1
  # GET /crm/activity/categories/1.json
  def show
  end

  # GET /crm/activity/categories/new
  # GET /crm/activity/categories/new.json
  def new
    @crm_activity_category = Crm::Activity::Category.new
    respond_to do |f|
      f.js { render :template => 'properties/new', locals: { property: @crm_activity_category } }
    end
  end

  # GET /crm/activity/categories/1/edit
  def edit
  end

  # POST /crm/activity/categories
  # POST /crm/activity/categories.json
  def create
    @crm_activity_category = Crm::Activity::Category.new crm_activity_category_params
    respond_to do |f|
      if @crm_activity_category.save
        f.js { render :template => 'properties/create', locals: { property: @crm_activity_category } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_activity_category.errors } }
      end
    end
  end

  # PUT /crm/activity/categories/1
  # PUT /crm/activity/categories/1.json
  def update
    respond_to do |f|
      if @crm_activity_category.update crm_activity_category_params
        f.js { render :template => 'properties/update', locals: { property: @crm_activity_category } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_activity_category.errors } }
      end
    end
  end

  # DELETE /crm/activity/categories/1
  # DELETE /crm/activity/categories/1.json
  def destroy
    @crm_activity_category.destroy

    respond_to do |f|
      f.js { render :template => 'properties/destroy', locals: { property: @crm_activity_category } }
    end
  end

  private
    def set_crm_activity_category
      @crm_activity_category = Crm::Activity::Category.find params[:id]
    end

    def crm_activity_category_params
      params.require(:crm_activity_category).permit(:name)
    end
end
