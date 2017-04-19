class EvaluatorsController < ApplicationController
  before_action :set_evaluator, only: [:show, :edit, :update, :destroy]

  # GET /evaluators
  # GET /evaluators.json
  def index
    @evaluators = Evaluator.all
  end

  # GET /evaluators/1
  # GET /evaluators/1.json
  def show
  end

  # GET /evaluators/new
  def new
    @languages = Language.all
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

    respond_to do |format|
      if @evaluator.save
        JudgeMailer.welcome(@evaluator).deliver_now
        format.html { redirect_to @evaluator, notice: 'Evaluator was successfully created.' }
        format.json { render :show, status: :created, location: @evaluator }
      else
        format.html { render :new }
        format.json { render json: @evaluator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluators/1
  # PATCH/PUT /evaluators/1.json
  def update
    @languages = Language.all
    respond_to do |format|
      if @evaluator.update(evaluator_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluator
      @evaluator = Evaluator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluator_params
      params.require(:evaluator).permit(:username, :first_name, :last_name, :email, :language_id, :code)
    end
end
