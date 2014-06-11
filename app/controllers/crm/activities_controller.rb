class Crm::ActivitiesController < ApplicationController
  load_and_authorize_resource :class => "Crm::Activity"
  before_action :set_crm_activity, only: [:show, :edit, :update, :destroy]
  def advanced_search
    @search = Crm::Activity.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @crm_activities  = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)

    respond_with @crm_activities
  end

  # GET /crm/activities
  # GET /crm/activities.json
  def index
    @q = Crm::Activity.accessible_by(current_ability).includes(:activityable, :status, :category, :person).order("time DESC").search(params[:q])
    @crm_activities = @q.result(:distinct => true).page(params[:page])

    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_activities }
    end
  end

  # GET /crm/activities/1
  # GET /crm/activities/1.json
  def show
  end

  # GET /crm/activities/new
  # GET /crm/activities/new.json
  def new
    @crm_activity = Crm::Activity.new

    if params[:type] == "Crm::Deal"
      contact_id = Crm::Deal.find(params[:id]).contact_id
    elsif params[:type] == "Crm::Contact"
      contact_id = params[:id]
    end

    @crm_activity.person_id = contact_id
    respond_to do |f|
      f.js
    end
  end

  # GET /crm/activities/1/edit
  def edit
  end

  # POST /crm/activities
  # POST /crm/activities.json
  def create
    @crm_activity = Crm::Activity.new(params[:crm_activity])
    @crm_activity.user_id = current_user.id
    respond_to do |f|
      if @crm_activity.save
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_activity.errors } }
      end
    end
  end

  # PUT /crm/activities/1
  # PUT /crm/activities/1.json
  def update
    respond_to do |f|
      if @crm_activity.update_attributes(params[:crm_activity])
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @crm_activity.errors } }
      end
    end
  end

  # DELETE /crm/activities/1
  # DELETE /crm/activities/1.json
  def destroy
    @crm_activity.destroy

    respond_to do |f|
      f.js
    end
  end

  private
    def set_crm_activity
      @crm_activity = Crm::Activity.find params[:id]
    end

    def crm_activity_params
      params.require(:crm_activity).permit(:activityable_id, :activityable_type, :category_id, :name, :note, :status_id, :user_id, :time, :person_id)
    end
end
