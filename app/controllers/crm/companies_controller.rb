class Crm::CompaniesController < ApplicationController
  before_action :set_crm_company, only: [:show, :edit, :update, :destroy]

  # GET /crm/companies
  # GET /crm/companies.json
  def index
    @crm_companies = Crm::Company.all
  end

  # GET /crm/companies/1
  # GET /crm/companies/1.json
  def show
  end

  # GET /crm/companies/new
  def new
    @crm_company = Crm::Company.new
  end

  # GET /crm/companies/1/edit
  def edit
  end

  # POST /crm/companies
  # POST /crm/companies.json
  def create
    @crm_company = Crm::Company.new(crm_company_params)

    respond_to do |format|
      if @crm_company.save
        format.html { redirect_to @crm_company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @crm_company }
      else
        format.html { render :new }
        format.json { render json: @crm_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crm/companies/1
  # PATCH/PUT /crm/companies/1.json
  def update
    respond_to do |format|
      if @crm_company.update(crm_company_params)
        format.html { redirect_to @crm_company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @crm_company }
      else
        format.html { render :edit }
        format.json { render json: @crm_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/companies/1
  # DELETE /crm/companies/1.json
  def destroy
    @crm_company.destroy
    respond_to do |format|
      format.html { redirect_to crm_companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crm_company
      @crm_company = Crm::Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crm_company_params
      params.require(:crm_company).permit(:name, :category_id, :zipcode, :mail, :note, :image, :user_id)
    end
end
