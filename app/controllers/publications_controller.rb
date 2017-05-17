
class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy,
    :create_carta_de_presentacion, :create_concepto_editorial ]
  # before_action :set_current_user, only: [:create_pdf]
  before_action :authenticate_administrator!, only: [:destroy]
  before_action :authorized?, only: [:new, :edit, :update, :create, :create_pdf]


  layout "unal"

  # GET /publications
  # GET /publications.json
  def index
    if professor_signed_in?
      @publications = Publication.publications_by_professor(current_professor.id).page(params[:page]).per_page(5)
    else
      @publications = Publication.search(params[:search],params[:category]).page(params[:page]).per_page(5)
    end
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template: 'pdf/formulario_15', pdf:'formulario_15', page_size: 'Letter',
          header: {
            html: {
              template: 'pdf/headers/header_formulario_15'
            }
          }
      end
    end
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    @categories = Category.all
    @themes = Theme.all

    @keywords = Keyword.all
    @words = @publication.keyword_publications.build
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

    params[:keywords][:ids].each do |keyword|
      if !keyword.empty?
        @publication.keyword_publications.build(:keyword_id => keyword)
      end
    end

    application_request = ApplicationRequest.create(state: 'En espera', professor_id: current_professor.id)
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

  def create_carta_de_presentacion
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template: 'pdf/formulario_13', pdf:'formulario_13', page_size: 'Letter',
        header: {
          html: {
            template: 'pdf/headers/header_formulario_13'
          }
        }
      end
    end
  end

  def create_concepto_editorial
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template: 'pdf/formulario_14_A', pdf:'formulario_14_A', page_size: 'Letter',
          header: {
            html: {
              template: 'pdf/headers/header_formulario_14'
            }
          }
      end
    end
  end

  def statistics
    @content = "publications/statistics"
    @publications = Publication.all
  end

  def customJson
    custom_json = []
    categories = Category.all
    publications = Publication.all
    categories.each do |categoria|
      cuenta = publications.where( :category_id => categoria.id ).count
      single = {
        # "category" => categories.where( :id => identif ),
        "category" => categoria.category,
        "count" => cuenta
      }
      custom_json << single
    end
    File.open("public/custom.json","w") do |f|
      f.write(custom_json.to_json)
    end
  end
  helper_method :customJson

  def dataTest
    custom_json = []
    categories = Category.all
    publications = Publication.all
    categories.each do |categoria|
      cuenta = publications.where( :category_id => categoria.id ).count
      single = [
        # "category" => categories.where( :id => identif ),
        categoria.category,
        cuenta
        # "category" => categoria.category,
        # "count" => cuenta
      ]
      custom_json << single
    end

    respond_to do |format|
       format.json {
         render :json => custom_json
       }
    end
  end

  def dataTheme
    custom_json = []
    themes = Theme.all
    publications = Publication.all
    themes.each do |tema|
      cuenta = publications.where( :theme_id => tema.id ).count
      single = [
        # "category" => categories.where( :id => identif ),
        tema.theme,
        cuenta
        # "category" => categoria.category,
        # "count" => cuenta
      ]
      custom_json << single
    end

    respond_to do |format|
       format.json {
         render :json => custom_json
       }
    end
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
