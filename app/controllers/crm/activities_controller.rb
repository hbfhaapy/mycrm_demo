class Crm::ActivitiesController < ApplicationController
  before_action :set_crm_activity, only: [:show, :edit, :update, :destroy]

  # GET /crm/activities
  # GET /crm/activities.json
  def index
    @crm_activities = Crm::Activity.all
  end

  # GET /crm/activities/1
  # GET /crm/activities/1.json
  def show
  end

  # GET /crm/activities/new
  def new
    @crm_activity = Crm::Activity.new
  end

  # GET /crm/activities/1/edit
  def edit
  end

  # POST /crm/activities
  # POST /crm/activities.json
  def create
    @crm_activity = Crm::Activity.new(crm_activity_params)

    respond_to do |format|
      if @crm_activity.save
        format.html { redirect_to @crm_activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @crm_activity }
      else
        format.html { render :new }
        format.json { render json: @crm_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crm/activities/1
  # PATCH/PUT /crm/activities/1.json
  def update
    respond_to do |format|
      if @crm_activity.update(crm_activity_params)
        format.html { redirect_to @crm_activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @crm_activity }
      else
        format.html { render :edit }
        format.json { render json: @crm_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/activities/1
  # DELETE /crm/activities/1.json
  def destroy
    @crm_activity.destroy
    respond_to do |format|
      format.html { redirect_to crm_activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crm_activity
      @crm_activity = Crm::Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crm_activity_params
      params.require(:crm_activity).permit(:name, :status_id, :category_id, :user_id, :note, :activityable_id, :activityable_type, :time, :person_id)
    end
end
