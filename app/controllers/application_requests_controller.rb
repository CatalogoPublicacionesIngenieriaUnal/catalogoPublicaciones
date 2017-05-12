class ApplicationRequestsController < ApplicationController
  before_action :set_application_request, only: [:show, :edit, :update, :destroy, :create_evaluator, :form_b, :form_b_create, :show_b]
  before_action :authorized?, only: [:new, :edit, :update, :create]
  before_action :authenticate_administrator!, only: [:index, :show, :destroy, :create_evaluator]

  layout "unal"
  # GET /application_requests
  # GET /application_requests.json
  def index
    @application_requests = ApplicationRequest.all
    @application_requests = ApplicationRequest.page(params[:page]).per_page(5)
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

  def show_b
    @editorial_concept_criteria = EditorialConceptCriterium.all
    @ed_con_app_request = EdConAppRequest.all
  end

  def form_b
    @editorial_concept_criteria = EditorialConceptCriterium.all
    @crits = []
    @editorial_concept_criteria.count.times do
      @crits << EdConAppRequest.new
    end
  end

  def form_b_create
    params[:edit_criteria].each do |ec|
      values = ec.values
      EdConAppRequest.create!(editorial_concept_criterium_id: values[0],
      score: values[1], remark: values[2], application_request_id: @application_request.id)
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
    @application_request.state = 'En evaluación'
    evaluation = Evaluation.create!(state: :sin_evaluar, application_request_id: @application_request.id)
    redirect_to new_evaluation_evaluator_path(evaluation.id)
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
