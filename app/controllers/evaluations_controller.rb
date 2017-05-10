class EvaluationsController < ApplicationController

  before_action :authenticate_administrator!, except: [:evaluate]
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

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
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
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
    @evaluator = Evaluator.evaluator_by_email(params[:evaluation][:email])
    unless @evaluator.nil?
       if(params[:evaluation][:code] == @evaluator.code && params[:evaluation][:url_token] == @evaluator.url_token)
         @evaluation = Evaluation.find(@evaluator.evaluation_id)
         @categories = Category.all
         @evaluations_criteria = EvaluationsCriterium.criteria_by_evaluation(@evaluation)
       else
         redirect_to not_authorized_path
       end
     else
       redirect_to :back
     end
   end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def evaluation_params
    params.require(:evaluation).permit(:justification, :state, :application_request_id, evaluations_criteria:[:score])
  end
end
