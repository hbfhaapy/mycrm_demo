class Fm::IncomesController < ApplicationController
  before_action :set_fm_income, only: [:show, :edit, :update, :destroy]

  # GET /fm/incomes
  # GET /fm/incomes.json
  def index
    @fm_incomes = Fm::Income.all
  end

  # GET /fm/incomes/1
  # GET /fm/incomes/1.json
  def show
  end

  # GET /fm/incomes/new
  def new
    @fm_income = Fm::Income.new
  end

  # GET /fm/incomes/1/edit
  def edit
  end

  # POST /fm/incomes
  # POST /fm/incomes.json
  def create
    @fm_income = Fm::Income.new(fm_income_params)

    respond_to do |format|
      if @fm_income.save
        format.html { redirect_to @fm_income, notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: @fm_income }
      else
        format.html { render :new }
        format.json { render json: @fm_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fm/incomes/1
  # PATCH/PUT /fm/incomes/1.json
  def update
    respond_to do |format|
      if @fm_income.update(fm_income_params)
        format.html { redirect_to @fm_income, notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @fm_income }
      else
        format.html { render :edit }
        format.json { render json: @fm_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fm/incomes/1
  # DELETE /fm/incomes/1.json
  def destroy
    @fm_income.destroy
    respond_to do |format|
      format.html { redirect_to fm_incomes_url, notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fm_income
      @fm_income = Fm::Income.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fm_income_params
      params.require(:fm_income).permit(:amount, :time, :note, :collection_id, :company_id, :user_id)
    end
end
