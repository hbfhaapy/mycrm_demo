class Crm::CompaniesController < ApplicationController
  load_and_authorize_resource :class => "Crm::Company"
  before_action :set_crm_company, only: [:show, :edit, :update, :destroy]
  def advanced_search
    @search = Crm::Company.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @crm_companies  = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)

    respond_with @crm_companies
  end

  # GET /crm/companies
  # GET /crm/companies.json
  def index
    @q = Crm::Company.accessible_by(current_ability).includes(:category, :contacts, :addresses, [:phones => :klass]).order("updated_at DESC").search(params[:q])
    @crm_companies = @q.result(:distinct => true).page(params[:page])
    respond_to do |f|
      f.html # index.html.erb
      f.json { render json: @crm_companies }
    end
  end

  # GET /crm/companies/1
  # GET /crm/companies/1.json
  def show
    @crm_company = Crm::Company.includes(:contracts => :status, :phones => :klass, :deals => [:status, :category, :contact], :contacts => [:status, :category, :addresses, :phones => :klass]).find(params[:id])
    @chart = @crm_company.basic_line_chart
  end

  # GET /crm/companies/new
  # GET /crm/companies/new.json
  def new
    @crm_company = Crm::Company.new
    phones = @crm_company.phones.new
    addresses = @crm_company.addresses.new
  end

  # GET /crm/companies/1/edit
  def edit
  end

  # POST /crm/companies
  # POST /crm/companies.json
  def create
    @crm_company = Crm::Company.new crm_company_params
    @crm_company.user_id = current_user.id
    respond_to do |f|
      if @crm_company.save
        f.html { redirect_to @crm_company, notice: '客户信息创建成功' }
        f.json { render json: @crm_company, status: :created, location: @crm_company }
      else
        f.html { render action: "new" }
        f.json { render json: @crm_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crm/companies/1
  # PUT /crm/companies/1.json
  def update
    respond_to do |f|
      if @crm_company.update crm_company_params
        f.html { redirect_to @crm_company, notice: '客户信息更新成功' }
        f.json { head :no_content }
      else
        f.html { render action: "edit" }
        f.json { render json: @crm_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crm/companies/1
  # DELETE /crm/companies/1.json
  def destroy
    @crm_company.destroy
    respond_to do |f|
      f.html { redirect_to crm_companies_url }
      f.json { head :no_content }
    end
  end

  private
    def set_crm_company
      @crm_company = Crm::Company.find params[:id]
    end

    def crm_company_params
      params.require(:crm_company).permit(:category_id, :image, :mail, :name, :note, :zipcode, :contacts_count, :deals_count, :phones_attributes, :addresses_attributes)
    end
end
