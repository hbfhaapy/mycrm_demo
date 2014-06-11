class SmartfindersController < ApplicationController

  before_action :set_smartfinder, only: [:show, :edit, :update, :destroy]
  # GET /smartfinders
  # GET /smartfinders.json
  def index
    @smartfinders = Smartfinder.all
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @smartfinders }
    end
  end

  # GET /smartfinders/1
  # GET /smartfinders/1.json
  def show
  end

  # GET /smartfinders/new
  # GET /smartfinders/new.json
  def new
    @smartfinder = Smartfinder.new
    respond_to do |f|
      f.js
    end
  end

  # GET /smartfinders/1/edit
  def edit
    respond_to do |f|
      f.js
    end
  end

  # POST /smartfinders
  # POST /smartfinders.json
  def create
    @smartfinder = Smartfinder.new smartfinder_params
    @smartfinder.user_id = current_user.id
    respond_to do |f|
      if @smartfinder.save
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @smartfinder.errors } }
      end
    end
  end

  # PUT /smartfinders/1
  # PUT /smartfinders/1.json
  def update
    respond_to do |f|
      if @smartfinder.update smartfinder_params
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @smartfinder.errors } }
      end
    end
  end

  # DELETE /smartfinders/1
  # DELETE /smartfinders/1.json
  def destroy
    @smartfinder.destroy
    respond_to do |f|
      f.js
    end
  end

  private
    def set_smartfinder
      @smartfinder = Smartfinder.find params[:id]
    end

    def smartfinder_params
      params.require(:smartfinder).permit(:klass, :name, :url, :user_id)
    end
end
