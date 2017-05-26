
class ApplicationRequestsController < ApplicationController

  protect_from_forgery except: :third_evaluator
  before_action :set_application_request, only: [:show, :edit, :update, :destroy,
    :create_evaluator, :form_b, :form_b_create, :show_b, :authorize, :reject,
    :final_concept, :final_concept_create, :evaluation_ended?, :third_evaluator]

  before_action :authorized?, only: [:new, :edit, :update, :create]
  before_action :authenticate_administrator!, except: [:new, :edit, :update, :create, :final_concept, :final_concept_create]
  before_action :in_evaluation?, except: [:show, :index, :show_b, :authorize, :reject_form]
  before_action :ready_to_evaluate?, only: :show
  before_action :evaluation_ended?, only: [:final_concept_create, :final_concept]

  layout "unal"
  # GET /application_requests
  # GET /application_requests.json
  def index
    @application_requests = ApplicationRequest.ready_requests.page(params[:page]).per_page(5)
  end
  def index_others
    @application_requests = ApplicationRequest.all
  end
  # GET /application_requests/1
  # GET /application_requests/1.json
  def show
    redirect_to final_concept_form_path(@application_request) if @application_request.state == 'En evaluación' && @application_request.evaluations_completed?
  end

  # GET /application_requests/new
  def new
    @application_request = ApplicationRequest.new
    @publication = params[:publication]
  end

  def show_b
    @editorial_concept_criteria = EditorialConceptCriterium.all
  end

  def form_b
    @editorial_concept_criteria = EditorialConceptCriterium.all
    if @application_request.ed_con_app_requests.count.zero?
      @editorial_concept_criteria.each do |ed_concept|
        EdConAppRequest.create!(application_request_id: @application_request.id, editorial_concept_criterium_id: ed_concept.id)
      end
    end
    @crits = @application_request.ed_con_app_requests
  end

  def form_b_create
    params[:edit_criteria].each do |id, ec|
      EdConAppRequest.find(id).update!(score: ec.values[1], remark: ec.values[2])
    end
    redirect_to show_b_url
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
    redirect_to new_evaluation_evaluator_path(evaluation.id)
  end

  def authorize
    if @application_request.evaluations.count < 2
      Evaluation.create!(state: :sin_evaluar, application_request_id: @application_request.id, finished: false)
      Evaluation.create!(state: :sin_evaluar, application_request_id: @application_request.id, finished: false)
    end
    @application_request.update!(state: :'En evaluación', authorized_at: DateTime.now)
    redirect_to @application_request
  end

  def reject;  end

  def reject_create
    application_request = ApplicationRequest.find(params[:id])
    remarks = params[:application_request][:editorial_remarks_to_authoreditorial_remarks_to_author]
    application_request.update!(editorial_remarks_to_author: remarks, state: 'Rechazado')
    redirect_to application_request
  end

  def third_evaluator
    if @application_request.evaluators.count < 3
      if @application_request.evaluations.count < 3
        @evaluation = Evaluation.create!(state: :sin_evaluar, application_request_id: @application_request.id, finished: false)
      else
        @evaluation = @application_request.evaluations.last
      end
      @languages = Language.all
      @evaluator = Evaluator.new
    else
      redirect_to :back
    end
  end

  def final_concept_create
    @application_request.update(state: params[:application_request][:state],
      editorial_remarks_to_author: params[:application_request][:editorial_remarks_to_author])
      redirect_to home_route
  end

  def final_concept
  end

  def dataRequestCreation
    custom_json = []
    años = Set.new
    meses = Set.new
    am = Set.new
    appreq = ApplicationRequest.all
    appreq.each do |apprequest|
      años.add( apprequest.created_at.year )
      meses.add( apprequest.created_at.month )
      am.add( [apprequest.created_at.year, apprequest.created_at.month] )
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

    arrKeys = data.keys
    arrKeys = arrKeys.sort

    arrKeys.each do |key|
      single = {
        "label" => key,
        "data" => data[key].values
      }
      custom_json << single
    end

    respond_to do |format|
      format.json {
        render :json => custom_json
      }
    end
  end

  def dataRequestStateDateAp
    custom_json = []
    aprobadas = ApplicationRequest.where( state: "Aprobado" )

    añosap = Set.new

    aprobadas.each do |apprequest|
      añosap.add( apprequest.final_concept_date.year )
    end

    añosa = añosap.to_a

    dataap = Hash.new()

    añosa.each do |año|
      dataap[año] = Hash.new()
      (1..12).each do |mes|
        dataap[año][mes] = 0
      end
    end

    aprobadas.each do |apprequest|
      dataap[ apprequest.final_concept_date.year ][ apprequest.final_concept_date.month ] = dataap[ apprequest.final_concept_date.year ][ apprequest.final_concept_date.month ] + 1
    end

    apKeys = dataap.keys
    apKeys = apKeys.sort

    apKeys.each do |key|
      single = {
        "label" => key,
        "data" => dataap[key].values
      }
      custom_json << single
    end

    respond_to do |format|
      format.json {
        render :json => custom_json
      }
    end
  end

  def dataRequestStateDateRe
    custom_json = []
    rechazadas = ApplicationRequest.where( state: "Rechazado" )

    añosre = Set.new

    rechazadas.each do |apprequest|
      añosre.add( apprequest.final_concept_date.year )
    end

    añosr = añosre.to_a

    datare = Hash.new()

    añosr.each do |año|
      datare[año] = Hash.new()
      (1..12).each do |mes|
        datare[año][mes] = 0
      end
    end

    rechazadas.each do |apprequest|
      datare[ apprequest.final_concept_date.year ][ apprequest.final_concept_date.month ] = datare[ apprequest.final_concept_date.year ][ apprequest.final_concept_date.month ] + 1
    end

    reKeys = datare.keys
    reKeys = reKeys.sort

    reKeys.each do |key|
      single = {
        "label" => key,
        "data" => datare[key].values
      }
      custom_json << single
    end

    respond_to do |format|
      format.json {
        render :json => custom_json
      }
    end
  end

  private
  def set_application_request
  # Use callbacks to share common setup or constraints between actions.
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

  def in_evaluation?
    puts "Validar que no se modifique mientras esté en evaluacion"
  end

  def ready_to_evaluate?
    @application_request = ApplicationRequest.find(params[:id])
    @application_request.ready_for_evaluation
  end

  def evaluation_ended?
    redirect_to @application_request unless @application_request.state == 'En evaluación' && @application_request.evaluations_completed?
  end

end
