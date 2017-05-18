require 'set'

class ApplicationRequestsController < ApplicationController
  before_action :set_application_request, only: [:show, :edit, :update, :destroy, :create_evaluator]
  before_action :authorized?, only: [:new, :edit, :update, :create]
  before_action :authenticate_administrator!, only: [:index, :show, :destroy, :create_evaluator]

  layout "unal"
  # GET /application_requests
  # GET /application_requests.json
  def index
    @application_requests = ApplicationRequest.all
  end

  # GET /application_requests/1
  # GET /application_requests/1.json
  def show
  end

  # GET /application_requests/new
  def new
    @application_request = ApplicationRequest.new
    @publication = params[:publication]
  end

  def edit
    @professors = Professor.all
  end

  # POST /application_requests
  # POST /application_requests.json
  def create
    @application_request = ApplicationRequest.new(application_request_params_a)
    @application_request.professor_id = current_professor.id
    @application_request.state = :'En creación'
    respond_to do |format|
      if @application_request.save
        format.html { redirect_to @application_request.publication, notice: 'Application request was successfully created.' }
        format.json { render :show, status: :created, location: @application_request }
      else
        format.html { render :new }
        format.json { render json: @application_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @application_request.update(application_request_params_a)
        format.html { redirect_to @application_request, notice: 'Application request was successfully updated.' }
        format.json { render :show, status: :ok, location: @application_request }
      else
        format.html { render :edit }
        format.json { render json: @application_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /application_requests/1
  # DELETE /application_requests/1.json
  def destroy
    @application_request.destroy
    respond_to do |format|
      format.html { redirect_to application_requests_url, notice: 'Application request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_evaluator
    @application_request.state = 'En evaluación'
    evaluation = Evaluation.create!(state: :sin_evaluar, application_request_id: @application_request.id)
    redirect_to new_evaluation_evaluator_path(evaluation.id)
  end

  def dataRequestCreation
    golden_ratio_conjugate = 0.618033988749895
    h = rand
    custom_json = []
    años = Set.new
    meses = Set.new
    am = Set.new
    appreq = ApplicationRequest.all
    appreq.each do |apprequest|
      años.add( apprequest.created_at.year )
      meses.add( apprequest.created_at.month )
      am.add( [apprequest.created_at.year, apprequest.created_at.month] )


      # cuenta = publications.where( :category_id => categoria.id ).count
      # h += golden_ratio_conjugate
      # h %= 1
      # rgb = hsv_to_rgb( h, 0.7, 0.75 )
      # single = {
      #   "añito" => años,
      #   "mesesito" => meses,
      #   "am" => am
      #
      #   # "value" => cuenta,
      #   # "color" => rgb_pls( rgb[0], rgb[1], rgb[2] )
      # }
      # custom_json << single
    end
    añossa = años.to_a
    data = Hash.new()
    añossa.each do |año|
      data[año] = Hash.new()
      (1..12).each do |mes|
        data[año][mes] = 0
      end
    end

    appreq.each do |apprequest|
      data[ apprequest.created_at.year ][ apprequest.created_at.month ] = data[ apprequest.created_at.year ][ apprequest.created_at.month ] + 1
    end

    single = {
      "añito" => años,
      "mesesito" => meses,
      "am" => am,
      "hash" => data
    }

    respond_to do |format|
      format.json {
        # render :json => custom_json
        render :json => single
      }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_application_request
    @application_request = ApplicationRequest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def application_request_params
    params.require(:application_request).permit(:state, :authorized_at, :professor_id)
  end

  def application_request_params_a
    params.require(:application_request).permit(:author_topic, :author_target_audience,
    :author_positioning_strategies, :author_academic_appreciation, :author_published_titles,
    :author_final_recomendation, :publication_id)
  end
end
