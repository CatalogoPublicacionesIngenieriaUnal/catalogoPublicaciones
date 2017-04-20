require "prawn"
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  # before_action :set_current_user, only: [:create_pdf]
  before_action :authenticate_administrator!, only: [:destroy]
  before_action :authorized?, only: [:new, :edit, :update, :create, :create_pdf]


  layout "unal"

  # GET /publications
  # GET /publications.json
  def index
    if professor_signed_in?
      @publications = Publication.publications_by_professor(current_professor.id)
    else
      @publications = Publication.all
    end
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
    @current_professor = current_professor
    @professors = Professor.all
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
    @categories = Category.all
    @themes = Theme.all
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)
    application_request = ApplicationRequest.create(state: :en_espera, professor_id: current_professor.id)
    @publication.application_request_id = application_request.id
    respond_to do |format|
      if @publication.save
        @publication.professors << current_professor
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

  # def download_pdf
  #   publ = Publication.find(params[:id])
  #   send_data create_pdf(publ), filename: "#{try01.pdf}", type: "application/pdf"
  #   end
  # end

  def create_pdf
    curr_prof = current_professor
    #p "#{@current_professor.first_name}"
    publ = Publication.find(params[:id])
    #tema = Theme.find(params[:theme_id])
    Prawn::Document.generate("public/publication.pdf", :margin => [10,80,80,80] ) do
      image "#{Rails.root}/public/logopdf.png", :position => :center, :scale => 0.16
      move_down 40
      font("Times-Roman") do
        text "#{curr_prof.first_name} #{curr_prof.last_name}"
        + " quiero publicar la " + publ.category.category + ' con el titulo "' + publ.title + '" y de tema ' + publ.theme.theme
        text 'Resumen: "' + publ.abstract + '"', :align => :justify
        # publ.professors.each do |profe|
        #   text "Yo, " + profe.first_name + " " + profe.last_name
        #   text 'Resumen: "' + publ.abstract + '"', :align => :justify
        # end
      end
      #text publ.current_professor.username
      #text tema.theme
    end
    redirect_to :back
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_publication
    @publication = Publication.find(params[:id])
  end
  #
  # def set_current_user
  #   @professor = current_professor
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def publication_params
    params.require(:publication).permit(:title, :abstract, :theme_id, :category_id, :keyword_ids, :application_request_id)
  end
end
