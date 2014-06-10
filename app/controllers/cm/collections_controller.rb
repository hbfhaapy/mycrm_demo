class Cm::CollectionsController < ApplicationController
  before_action :set_cm_collection, only: [:show, :edit, :update, :destroy]

  # GET /cm/collections
  # GET /cm/collections.json
  def index
    @cm_collections = Cm::Collection.all
  end

  # GET /cm/collections/1
  # GET /cm/collections/1.json
  def show
  end

  # GET /cm/collections/new
  def new
    @cm_collection = Cm::Collection.new
  end

  # GET /cm/collections/1/edit
  def edit
  end

  # POST /cm/collections
  # POST /cm/collections.json
  def create
    @cm_collection = Cm::Collection.new(cm_collection_params)

    respond_to do |format|
      if @cm_collection.save
        format.html { redirect_to @cm_collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @cm_collection }
      else
        format.html { render :new }
        format.json { render json: @cm_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cm/collections/1
  # PATCH/PUT /cm/collections/1.json
  def update
    respond_to do |format|
      if @cm_collection.update(cm_collection_params)
        format.html { redirect_to @cm_collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @cm_collection }
      else
        format.html { render :edit }
        format.json { render json: @cm_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cm/collections/1
  # DELETE /cm/collections/1.json
  def destroy
    @cm_collection.destroy
    respond_to do |format|
      format.html { redirect_to cm_collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cm_collection
      @cm_collection = Cm::Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cm_collection_params
      params.require(:cm_collection).permit(:name, :percent, :time, :contact_id, :user_id_id)
    end
end
