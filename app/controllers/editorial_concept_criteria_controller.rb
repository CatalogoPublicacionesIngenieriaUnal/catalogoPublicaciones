class EditorialConceptCriteriaController < ApplicationController
  before_action :set_editorial_concept_criterium, only: [:show, :edit, :update, :destroy]

  # GET /editorial_concept_criteria
  # GET /editorial_concept_criteria.json
  def index
    @editorial_concept_criteria = EditorialConceptCriterium.all
  end

  # GET /editorial_concept_criteria/1
  # GET /editorial_concept_criteria/1.json
  def show
  end

  # GET /editorial_concept_criteria/new
  def new
    @editorial_concept_criterium = EditorialConceptCriterium.new
  end

  # GET /editorial_concept_criteria/1/edit
  def edit
  end

  # POST /editorial_concept_criteria
  # POST /editorial_concept_criteria.json
  def create
    @editorial_concept_criterium = EditorialConceptCriterium.new(editorial_concept_criterium_params)

    respond_to do |format|
      if @editorial_concept_criterium.save
        format.html { redirect_to @editorial_concept_criterium, notice: 'Editorial concept criterium was successfully created.' }
        format.json { render :show, status: :created, location: @editorial_concept_criterium }
      else
        format.html { render :new }
        format.json { render json: @editorial_concept_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editorial_concept_criteria/1
  # PATCH/PUT /editorial_concept_criteria/1.json
  def update
    respond_to do |format|
      if @editorial_concept_criterium.update(editorial_concept_criterium_params)
        format.html { redirect_to @editorial_concept_criterium, notice: 'Editorial concept criterium was successfully updated.' }
        format.json { render :show, status: :ok, location: @editorial_concept_criterium }
      else
        format.html { render :edit }
        format.json { render json: @editorial_concept_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editorial_concept_criteria/1
  # DELETE /editorial_concept_criteria/1.json
  def destroy
    @editorial_concept_criterium.destroy
    respond_to do |format|
      format.html { redirect_to editorial_concept_criteria_url, notice: 'Editorial concept criterium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editorial_concept_criterium
      @editorial_concept_criterium = EditorialConceptCriterium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editorial_concept_criterium_params
      params.require(:editorial_concept_criterium).permit(:criterium)
    end
end
