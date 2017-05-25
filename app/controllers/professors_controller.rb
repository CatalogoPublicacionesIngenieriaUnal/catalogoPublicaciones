class ProfessorsController < ApplicationController

  before_action :set_professor, only: [:update, :destroy]
  before_action :set_current_professor, only: [:edit, :show]
  before_action :authenticate_administrator!, only: [:index, :destroy, :autorize]

  layout "unal"


  def not_authorized
  end
  # GET /professors
  # GET /professors.json
  def index
    # @professors = Professor.all
    @professors = Professor.search(params[:is_authorized]).page(params[:page]).per_page(5)
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
  end

  def home
    @publications = Publication.all
    @professors = Professor.all
    if professor_signed_in?
      @publications = Publication.publications_by_professor(current_professor.id)
    end
  end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit
  end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Se ha creado el profesor.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_edit_params)
        format.html { redirect_to home_route }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to home_route }
      format.json { head :no_content }
    end
  end

  def autorize
    Professor.where(id: params[:professor_ids]).update_all(is_authorized: true)
    redirect_to home_route
  end

  def dataDepartmentPie
    golden_ratio_conjugate = 0.618033988749895
    h = rand
    custom_json = []
    departamento = ['nope','Departamento de ingeniería civil y agrícola',
      'Departamento de ingeniería de sistemas e industrial',
      'Departamento de ingeniería eléctrica y electrónica',
      'Departamento de ingeniería mecánica y mecatrónica',
      'Departamento de ingeniería química y ambiental',
      'Instituto de extensión e investigación IEI']
    professors = Professor.all
    (1..6).each do |dpto|
      cuenta = professors.where( :department => dpto ).count
      h += golden_ratio_conjugate
      h %= 1
      rgb = hsv_to_rgb( h, 0.7, 0.75 )
      single = {
        "label" => departamento[dpto],
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

  def dataGenderPie
    golden_ratio_conjugate = 0.618033988749895
    h = rand
    custom_json = []
    genero = ['nope','Masculino','Femenino']
    professors = Professor.all
    (1..2).each do |gene|
      cuenta = professors.where( :gender => gene ).count
      h += golden_ratio_conjugate
      h %= 1
      rgb = hsv_to_rgb( h, 0.7, 0.75 )
      single = {
        "label" => genero[gene],
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
    def set_professor
      @professor = Professor.find(params[:id])
    end

    def set_current_professor
      @professor = Professor.find(current_professor.id)
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:username, :first_name, :last_name, :identity_document_type, :identity_document, :identity_document_issued, :email, :department, :dependency, :position, :contact_number, :gender, :is_authorized)
    end
    def professor_edit_params
      params.require(:professor).permit(:identity_document_type, :identity_document, :identity_document_issued,:department, :dependency, :position, :contact_number, :gender)
    end
end
