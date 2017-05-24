class EvaluatorsController < ApplicationController

  before_action :set_evaluator, only: [:update, :destroy]
  before_action :set_current_evaluator, only: [:edit, :show, :update_password, :edit_password, :home]

  before_action :authenticate_administrator!, only: [:new, :create, :destroy, :index]
  before_action :authenticate_evaluator!, only: [:show, :update, :edit, :update_password, :edit_password, :home]

  # GET /evaluators
  # GET /evaluators.json
  def index
    @evaluators = Evaluator.all
  end

  def home
  end

  def update_password
    if @evaluator.update_with_password(evaluator_password_params)
      @evaluator.update(first_update: true)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@evaluator)
      redirect_to home_route
    else
      render evaluator_edit_password_path
    end
  end

  def edit_password
    redirect_to edit_current_evaluator_path if @evaluator.institution.nil? || @evaluator.degree.nil?
  end

  # GET /evaluators/1
  # GET /evaluators/1.json
  def show
    if @evaluator.institution.nil? || @evaluator.degree.nil?
      redirect_to edit_current_evaluator_path
    elsif !@evaluator.first_update
      redirect_to evaluator_edit_password_path
    end
    @languages = Language.all
  end

  # GET /evaluators/new
  def new
    @languages = Language.all
    @evaluation = Evaluation.find(params[:evaluation_id])
    @evaluator = Evaluator.new
  end

  # GET /evaluators/1/edit
  def edit
    @languages = Language.all
  end

  # POST /evaluators
  # POST /evaluators.json
  def create
    @languages = Language.all
    @evaluator = Evaluator.new(evaluator_params)
    @evaluator.evaluation_id = params[:evaluation_id]
    @evaluator.save
  end

  # PATCH/PUT /evaluators/1
  # PATCH/PUT /evaluators/1.json
  def update
    @languages = Language.all
    respond_to do |format|
      if @evaluator.update(evaluator_edit_params)
        format.html { redirect_to @evaluator, notice: 'Evaluator was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluator }
      else
        format.html { render :edit }
        format.json { render json: @evaluator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluators/1
  # DELETE /evaluators/1.json
  def destroy
    @evaluator.destroy
    respond_to do |format|
      format.html { redirect_to evaluators_url, notice: 'Evaluator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def home
    @evaluation = Evaluation.find(@evaluator.evaluation_id)
    @attatchment = @evaluation.publication
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluator
      #@evaluator = Evaluator.find(params[:id])
    end

    def set_current_evaluator
      @evaluator = Evaluator.find(current_evaluator.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluator_params
      params.require(:evaluator).permit(:first_name, :last_name, :email, :language_id,
      :evaluation_id, :password)
    end

    def evaluator_edit_params
      params.require(:evaluator).permit(:first_name, :last_name, :email, :language_id,
      :position, :institution, :degree, :degree_institution, :contact_number)
    end

    def evaluator_password_params
      params.require(:evaluator).permit(:password, :password_confirmation, :current_password)
    end
end
