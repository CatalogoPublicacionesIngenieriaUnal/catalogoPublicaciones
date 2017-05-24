class EvaluationsController < ApplicationController

  before_action :authenticate!
  before_action :authenticate_evaluator!, only: [:evaluate, :update, :finish]
  before_action :authenticate_administrator!, only: [:create, :index, :new, :show]
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy, :authorized?, :finish, :upload_pdf]
  before_action :authorized?, only: [:show, :update]

  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = Evaluation.all
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      params[:eval_criteria].each do |ev, score|
        evaluations_criterium = EvaluationsCriterium.find(ev)
        evaluations_criterium.score = score[:score]
        evaluations_criterium.save
      end
      if @evaluation.update!(evaluation_params)
        format.html { redirect_to evaluator_home_path, notice: 'Se guardo la evaluacion con exito.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def evaluate
    @evaluator = current_evaluator
    @evaluation = Evaluation.find(@evaluator.evaluation_id)
    @categories = Category.all
    @evaluations_criteria = EvaluationsCriterium.criteria_by_evaluation(@evaluation)

  end

  def finish
    redirect_to :not_authorized unless @evaluation.evaluator == current_evaluator
    @evaluation.finish
    if @evaluation.errors.any?
      redirect_to evaluator_home_path
    else
      @evaluation.evaluation_complete
      redirect_to not_authorized_path
    end
  end

  def upload_pdf
    EvaluationAttatchment.create(pdf_document: params[:evaluation_attatchment][:pdf_evaluation],
    evaluator: current_evaluator.get_name, evaluation_id: @evaluation.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def evaluation_params
    params.require(:evaluation).permit(:justification, :state, :application_request_id,
    :publication_clasiffication, :publication_translated_material, :publication_synopsis,
    :general_score_justification, :writing_score_jistification, :aditional_remarks_to_author,
    :aditional_remarks_to_publisher, :disclosure_degree, :target_audience, :target_audience_remark,
    :extra_target_audience)
  end

  def authenticate!
    redirect_to :not_authorized_path unless (administrator_signed_in? || evaluator_signed_in?)
  end

  def authorized?
    redirect_to :not_authorized unless @evaluation.evaluator == current_evaluator
  end

end
