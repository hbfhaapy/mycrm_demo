class Crm::Contact::CategoriesController < ApplicationController
  load_and_authorize_resource :class => "Crm::Contact::Category"
  before_action :set_crm_contact_category, only: [:show, :edit, :update, :destroy]
  # GET /crm/contact/categories
  # GET /crm/contact/categories.json
  def index
    @crm_contact_categories = Crm::Contact::Category.all
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_contact_categories }
    end
  end

  # GET /crm/contact/categories/1
  # GET /crm/contact/categories/1.json
  def show
  end

  # GET /crm/contact/categories/new
  # GET /crm/contact/categories/new.json
  def new
    @crm_contact_category = Crm::Contact::Category.new
    respond_to do |f|
      f.js { render :template => 'properties/new', locals: { property: @crm_contact_category } }
    end
  end

  # GET /crm/contact/categories/1/edit
  def edit
  end

  # POST /crm/contact/categories
  # POST /crm/contact/categories.json
  def create
    @crm_contact_category = Crm::Contact::Category.new crm_contact_category_params
    respond_to do |f|
      if @crm_contact_category.save
        f.js { render :template => 'properties/create', locals: { property: @crm_contact_category } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_contact_category.errors } }
      end
    end
  end

  # PUT /crm/contact/categories/1
  # PUT /crm/contact/categories/1.json
  def update
    respond_to do |f|
      if @crm_contact_category.update crm_contact_category_params
        f.js { render :template => 'properties/update', locals: { property: @crm_contact_category } }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_contact_category.errors } }
      end
    end
  end

  # DELETE /crm/contact/categories/1
  # DELETE /crm/contact/categories/1.json
  def destroy
    @crm_contact_category.destroy
    respond_to do |f|
      f.js { render :template => 'properties/destroy', locals: { property: @crm_contact_category } }
    end
  end

  private
    def set_crm_contact_category
      @crm_contact_category = Crm::Contact::Category.find params[:id]
    end

    def crm_contact_category_params
      params.require(:crm_contact_category).permit(:name)
    end
end
