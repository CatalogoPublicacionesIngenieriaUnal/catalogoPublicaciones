class AttatchmentsController < ApplicationController
  before_action :set_attatchment, only: [:show, :edit, :update, :destroy]
  layout "unal"

  # GET /attatchments
  # GET /attatchments.json
  def index
    @attatchments = Attatchment.all
  end

  # GET /attatchments/1
  # GET /attatchments/1.json
  def show
  end

  # GET /attatchments/new
  def new
    @attatchment = Attatchment.new
  end

  # GET /attatchments/1/edit
  def edit
  end

  # POST /attatchments
  # POST /attatchments.json
  def create
    @attatchment = Attatchment.new(attatchment_params)
    @attatchment.application_request_id = params[:application_request_id]
    respond_to do |format|
      if @attatchment.save
        format.html {redirect_back(fallback_location: :back)}
        format.json { render :show, status: :created, location: @attatchment }
      else
        puts @attatchment.errors.inspect
        format.html { redirect_back(fallback_location: :back)}
        format.json { render json: @attatchment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attatchments/1
  # PATCH/PUT /attatchments/1.json
  def update
    respond_to do |format|
      if @attatchment.update(attatchment_params)
        format.html { redirect_to @attatchment, notice: 'Attatchment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attatchment }
      else
        format.html { render :edit }
        format.json { render json: @attatchment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attatchments/1
  # DELETE /attatchments/1.json
  def destroy
    if professor_signed_in?
      @publications = Publication.publications_by_professor(current_professor.id)
    else
      @publications = Publication.search(params[:search],params[:category])
    end
    @attatchment.destroy
    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_attatchment
    @attatchment = Attatchment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attatchment_params
    params.require(:attatchment).permit(:category, :application_request_id, :pdf_document)
  end
end
