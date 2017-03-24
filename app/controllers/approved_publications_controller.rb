class ApprovedPublicationsController < ApplicationController
  before_action :set_approved_publication, only: [:show, :edit, :update, :destroy]

  # GET /approved_publications
  # GET /approved_publications.json
  def index
    @approved_publications = ApprovedPublication.all
  end

  # GET /approved_publications/1
  # GET /approved_publications/1.json
  def show
  end

  # GET /approved_publications/new
  def new
    @approved_publication = ApprovedPublication.new
  end

  # GET /approved_publications/1/edit
  def edit
  end

  # POST /approved_publications
  # POST /approved_publications.json
  def create
    @approved_publication = ApprovedPublication.new(approved_publication_params)

    respond_to do |format|
      if @approved_publication.save
        format.html { redirect_to @approved_publication, notice: 'Approved publication was successfully created.' }
        format.json { render :show, status: :created, location: @approved_publication }
      else
        format.html { render :new }
        format.json { render json: @approved_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approved_publications/1
  # PATCH/PUT /approved_publications/1.json
  def update
    respond_to do |format|
      if @approved_publication.update(approved_publication_params)
        format.html { redirect_to @approved_publication, notice: 'Approved publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @approved_publication }
      else
        format.html { render :edit }
        format.json { render json: @approved_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approved_publications/1
  # DELETE /approved_publications/1.json
  def destroy
    @approved_publication.destroy
    respond_to do |format|
      format.html { redirect_to approved_publications_url, notice: 'Approved publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approved_publication
      @approved_publication = ApprovedPublication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approved_publication_params
      params.require(:approved_publication).permit(:resolution, :stock, :stock_at_store, :stock_at_library)
    end
end
