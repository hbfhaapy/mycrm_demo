class RolesController < ApplicationController
  load_and_authorize_resource :class => "Role"
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.includes(:users).all

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new
    respond_to do |f|
      f.js
    end
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new role_params
    respond_to do |f|
      if @role.save
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @role.errors } }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    respond_to do |f|
      if @role.update role_params
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @user.errors } }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy

    respond_to do |f|
      f.js
    end
  end

  private
    def set_role
      @role = Role.find params[:id]
    end

    def role_params
      params.require(:role).permit(:name)
    end
end
