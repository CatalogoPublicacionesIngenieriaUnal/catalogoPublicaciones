require "prawn"
class PublicationsController < ApplicationController
  before_action :my_publication?, only: [:show, :edit, :update, :destroy, :evaluate]
  before_action :set_publication, only: [:show, :edit, :update, :destroy, :evaluate]
  before_action :authenticate_administrator!, only: [:destroy]
  before_action :authorized?, only: [:new, :edit, :update, :create, :create_pdf]
  before_action :set_attributes, only: [:new, :create]
  before_action :set_attributes_edit, only: [:update, :edit]


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
      format.pdf{render template: 'publications/reporte', pdf:'Reporte'}
    end
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    if @publication.application_request.nil?
      redirect_to new_application_request_path(publication: @publication)
    end
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    @categories = Category.all
    @themes = Theme.all
    @appRequest = ApplicationRequest.all

    @keywords = Keyword.all
    @words = @publication.keyword_publications.build
    @current_professor = current_professor
    @professors = Professor.all
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
      unless keyword.empty?
        @publication.keyword_publications.build(keyword_id: keyword)
      end
    end
    respond_to do |format|
      if @publication.save
        @publication.professors << current_professor
        format.html { redirect_to new_application_request_path(publication: @publication), notice: 'Publication was successfully created.' }
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

  def evaluate
    @publication.application_request.update(state: 'En espera') if @publication.request_completeness == 100
    redirect_to @publication
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

  def statistics
    @content = "publications/statistics"
    @publications = Publication.all
  end

  def dataCateg
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

  def dataCategPie
    golden_ratio_conjugate = 0.618033988749895
    h = rand
    custom_json = []
    categories = Category.all
    publications = Publication.all
    categories.each do |categoria|
      cuenta = publications.where( :category_id => categoria.id ).count
      h += golden_ratio_conjugate
      h %= 1
      rgb = hsv_to_rgb( h, 0.7, 0.75 )
      single = {
        "label" => categoria.category,
        "value" => cuenta,
        "color" => rgb_pls( rgb[0], rgb[1], rgb[2] )
      }
      custom_json << single
    end

    respond_to do |format|
       format.json {
         render :json => custom_json
       }
    end
  end

  def dataThemePie
    golden_ratio_conjugate = 0.618033988749895
    h = rand
    custom_json = []
    themes = Theme.all
    publications = Publication.all
    themes.each do |tema|
      cuenta = publications.where( :theme_id => tema.id ).count
      h += golden_ratio_conjugate
      h %= 1
      rgb = hsv_to_rgb( h, 0.7, 0.75 )
      single = {
        "label" => tema.theme,
        "value" => cuenta,
        "color" => rgb_pls( rgb[0], rgb[1], rgb[2] )
      }
      custom_json << single
    end

    respond_to do |format|
       format.json {
         render :json => custom_json
       }
    end
  end

  def dataStatusPie
    golden_ratio_conjugate = 0.618033988749895
    h = rand
    custom_json = []
    appreq = ApplicationRequest.all
    estados = ['En creación','En espera', 'En evaluación', 'Aprobado', 'Rechazado']
    # publications = Publication.all
    (0..4).each do |estado|
      cuenta = appreq.where( :state => estado ).count
      h += golden_ratio_conjugate
      h %= 1
      rgb = hsv_to_rgb( h, 0.7, 0.75 )
      single = {
        "label" => estados[estado],
        "value" => cuenta,
        "color" => rgb_pls( rgb[0], rgb[1], rgb[2] )
      }
      custom_json << single
    end

    respond_to do |format|
       format.json {
         render :json => custom_json
       }
    end
  end



  def hsv_to_rgb(h, s, v)
    h_i = (h * 6).to_i
    f = h * 6 - h_i
    p = v * (1 - s)
    q = v * (1 - f * s)
    t = v * (1 - (1 - f) * s)
    r, g, b = v, t, p if h_i==0
    r, g, b = q, v, p if h_i==1
    r, g, b = p, v, t if h_i==2
    r, g, b = p, q, v if h_i==3
    r, g, b = t, p, v if h_i==4
    r, g, b = v, p, q if h_i==5
    [(r*256).to_i, (g*256).to_i, (b*256).to_i]
  end
  def rgb_pls( r, g, b )
    "##{to_hex r}#{to_hex g}#{to_hex b}"
  end
  def to_hex(n)
    n.to_s(16).rjust(2,'0').upcase
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_publication
    @publication = Publication.find(params[:id])
    @words = @publication.keyword_publications.build
  end

  def set_attributes
    @publication = Publication.new
    @categories = Category.all
    @themes = Theme.all
    @professors = Professor.all
    @keywords = Keyword.all
    @words = @publication.keyword_publications.build
  end

  def set_attributes_edit
    @categories = Category.all
    @themes = Theme.all
    @professors = Professor.all
    @keywords = Keyword.all
  end
  #
  # def set_current_user
  #   @professor = current_professor
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def publication_params
    params.require(:publication).permit(:title, :abstract, :theme_id, :category_id, :keyword_ids, :application_request_id)
  end

  def my_publication?
    @publication = Publication.find(params[:id])
    redirect_to not_authorized_path unless @publication.professors_owner == current_professor
  end

end
