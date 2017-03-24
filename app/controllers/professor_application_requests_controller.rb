class ProfessorApplicationRequestsController < ApplicationController
  before_action :set_professor_application_request, only: [:show, :edit, :update, :destroy]

  # GET /professor_application_requests
  # GET /professor_application_requests.json
  def index
    @professor_application_requests = ProfessorApplicationRequest.all
  end

  # GET /professor_application_requests/1
  # GET /professor_application_requests/1.json
  def show
  end

  # GET /professor_application_requests/new
  def new
    @professor_application_request = ProfessorApplicationRequest.new
  end

  # GET /professor_application_requests/1/edit
  def edit
  end

  # POST /professor_application_requests
  # POST /professor_application_requests.json
  def create
    @professor_application_request = ProfessorApplicationRequest.new(professor_application_request_params)

    respond_to do |format|
      if @professor_application_request.save
        format.html { redirect_to @professor_application_request, notice: 'Professor application request was successfully created.' }
        format.json { render :show, status: :created, location: @professor_application_request }
      else
        format.html { render :new }
        format.json { render json: @professor_application_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professor_application_requests/1
  # PATCH/PUT /professor_application_requests/1.json
  def update
    respond_to do |format|
      if @professor_application_request.update(professor_application_request_params)
        format.html { redirect_to @professor_application_request, notice: 'Professor application request was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor_application_request }
      else
        format.html { render :edit }
        format.json { render json: @professor_application_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professor_application_requests/1
  # DELETE /professor_application_requests/1.json
  def destroy
    @professor_application_request.destroy
    respond_to do |format|
      format.html { redirect_to professor_application_requests_url, notice: 'Professor application request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor_application_request
      @professor_application_request = ProfessorApplicationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_application_request_params
      params.fetch(:professor_application_request, {})
    end
end
