
class Fm::IncomesController < ApplicationController
  load_and_authorize_resource :class => "Fm::Income"
  before_action :set_fm_income, only: [:show, :edit, :update, :destroy]
  def advanced_search
    @search = Fm::Income.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @fm_incomes  = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)
    respond_with @fm_incomes
  end

  # GET /fm/incomes
  # GET /fm/incomes.json
  def index
    @q = Fm::Income.accessible_by(current_ability).includes(:company, :collection => [:contract => :plan]).order("time DESC").search(params[:q])
    @fm_incomes = @q.result(:distinct => true).page(params[:page])
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @fm_incomes }
    end
  end

  # GET /fm/incomes/1
  # GET /fm/incomes/1.json
  def show
  end

  # GET /fm/incomes/new
  # GET /fm/incomes/new.json
  def new
    collection = Cm::Collection.find(params[:collection_id])
    @fm_income = collection.incomes.new
    @fm_income.user_id = current_user.id
    @fm_income.company_id = @fm_income.collection.contract.company_id
    respond_to do |f|
      f.js
    end
  end

  # GET /fm/incomes/1/edit
  def edit
  end

  # POST /fm/incomes
  # POST /fm/incomes.json
  def create
    @fm_income = Fm::Income.new fm_income_params
    @fm_income.user_id = current_user.id
    respond_to do |f|
      if @fm_income.save
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @fm_income.errors } }
      end
    end
  end

  # PUT /fm/incomes/1
  # PUT /fm/incomes/1.json
  def update
    respond_to do |f|
      if @fm_income.update fm_income_params
        f.js
      else
        f.js { render :template => 'layouts/error', locals: { errors: @fm_income.errors } }
      end
    end
  end

  # DELETE /fm/incomes/1
  # DELETE /fm/incomes/1.json
  def destroy
    @fm_incoe.destroy
    respond_to do |f|
      f.js
    end
  end

  private
    def set_fm_income
      @fm_income = Fm::Income.find params[:id]
    end

    def fm_income_params
      params.require(:fm_income).permit(:amount, :collection_id, :note, :time, :user_id, :company_id)
    end
end
