class OrganizationsController < ApplicationController
  load_and_authorize_resource :class => "Organization"
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  include TheSortableTreeController::Rebuild

  def manage
    @organizations = Organization.nested_set.select(:id, :name, :parent_id).all
  end
  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.includes(:parent).page(params[:page])

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  # GET /organizations/new.json
  def new
    @organization = Organization.new
    respond_to do |f|
      f.js
    end
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new organization_params

    respond_to do |f|
      if @organization.save
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @organization.errors } }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.json
  def update
    respond_to do |f|
      if @organization.update organization_params
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @user.errors } }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |f|
      f.js
    end
  end

  private
    def set_organization
      @organization = Organization.find params[:id]
    end

    def organization_params
      params.require(:organization).permit(:depth, :lft, :name, :parent_id, :rgt)
    end
end