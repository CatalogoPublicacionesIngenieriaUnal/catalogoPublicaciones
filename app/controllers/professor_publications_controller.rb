class ProfessorPublicationsController < ApplicationController
  before_action :set_professor_publication, only: [:show, :edit, :update, :destroy]

  # GET /professor_publications
  # GET /professor_publications.json
  def index
    @professor_publications = ProfessorPublication.all
  end

  # GET /professor_publications/1
  # GET /professor_publications/1.json
  def show
  end

  # GET /professor_publications/new
  def new
    @professor_publication = ProfessorPublication.new
  end

  # GET /professor_publications/1/edit
  def edit
  end

  # POST /professor_publications
  # POST /professor_publications.json
  def create
    @professor_publication = ProfessorPublication.new(professor_publication_params)

    respond_to do |format|
      if @professor_publication.save
        format.html { redirect_to @professor_publication, notice: 'Professor publication was successfully created.' }
        format.json { render :show, status: :created, location: @professor_publication }
      else
        format.html { render :new }
        format.json { render json: @professor_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professor_publications/1
  # PATCH/PUT /professor_publications/1.json
  def update
    respond_to do |format|
      if @professor_publication.update(professor_publication_params)
        format.html { redirect_to @professor_publication, notice: 'Professor publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor_publication }
      else
        format.html { render :edit }
        format.json { render json: @professor_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professor_publications/1
  # DELETE /professor_publications/1.json
  def destroy
    @professor_publication.destroy
    respond_to do |format|
      format.html { redirect_to professor_publications_url, notice: 'Professor publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor_publication
      @professor_publication = ProfessorPublication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_publication_params
      params.fetch(:professor_publication, {})
    end
end
