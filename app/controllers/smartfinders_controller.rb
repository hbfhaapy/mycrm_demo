class SmartfindersController < ApplicationController
  before_action :set_smartfinder, only: [:show, :edit, :update, :destroy]

  # GET /smartfinders
  # GET /smartfinders.json
  def index
    @smartfinders = Smartfinder.all
  end

  # GET /smartfinders/1
  # GET /smartfinders/1.json
  def show
  end

  # GET /smartfinders/new
  def new
    @smartfinder = Smartfinder.new
  end

  # GET /smartfinders/1/edit
  def edit
  end

  # POST /smartfinders
  # POST /smartfinders.json
  def create
    @smartfinder = Smartfinder.new(smartfinder_params)

    respond_to do |format|
      if @smartfinder.save
        format.html { redirect_to @smartfinder, notice: 'Smartfinder was successfully created.' }
        format.json { render :show, status: :created, location: @smartfinder }
      else
        format.html { render :new }
        format.json { render json: @smartfinder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smartfinders/1
  # PATCH/PUT /smartfinders/1.json
  def update
    respond_to do |format|
      if @smartfinder.update(smartfinder_params)
        format.html { redirect_to @smartfinder, notice: 'Smartfinder was successfully updated.' }
        format.json { render :show, status: :ok, location: @smartfinder }
      else
        format.html { render :edit }
        format.json { render json: @smartfinder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smartfinders/1
  # DELETE /smartfinders/1.json
  def destroy
    @smartfinder.destroy
    respond_to do |format|
      format.html { redirect_to smartfinders_url, notice: 'Smartfinder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smartfinder
      @smartfinder = Smartfinder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def smartfinder_params
      params.require(:smartfinder).permit(:url, :klass, :name, :user_id)
    end
end
