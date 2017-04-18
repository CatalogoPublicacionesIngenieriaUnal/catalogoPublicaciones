class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_administrator!, only: [:destroy]
  before_action :authorized?, only: [:new, :edit, :update]


  layout "unal"

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.all
    respond_to do |format|
      format.html
      format.json
      format.pdf{render template: 'publications/reporte', pdf:'Reporte'}
    end
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @categories = Category.all
    @themes = Theme.all
    @keywords = Keyword.all
    @publication = Publication.new
    @categories_options = Category.all.map{ |u| [u.id, u.category] }
    @themes_options = Theme.all.map{ |v| [v.id, v.theme] }
  end

  # GET /publications/1/edit
  def edit
    @categories = Category.all
    @themes = Theme.all
  end

  # POST /publications
  # POST /publications.json
  def create
    @categories = Category.all
    @themes = Theme.all
    @publication = Publication.new(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_publication
    @publication = Publication.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def publication_params
    params.require(:publication).permit(:title, :abstract, :category, :theme_id, :category_id)
  end
end
