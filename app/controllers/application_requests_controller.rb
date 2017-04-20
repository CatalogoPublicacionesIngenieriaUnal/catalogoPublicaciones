class ApplicationRequestsController < ApplicationController
  before_action :set_application_request, only: [:show, :edit, :update, :destroy, :authorize]
  before_action :authorized?, only: [:new, :edit, :update, :create]
  before_action :authenticate_administrator!, only: [:index, :show, :destroy]

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
  end

  def authorize
    @application_request.state = :en_evaluacion
    Evaluation.create(state: :sin_evaluar, application_request_id: @application_request.id)
    Evaluation.create(state: :sin_evaluar, application_request_id: @application_request.id)
    redirect_to :back
  end

  # POST /application_requests
  # POST /application_requests.json
  def create
    @application_request = ApplicationRequest.new(application_request_params)
    respond_to do |format|
      if @application_request.save
        format.html { redirect_to @application_request, notice: 'Application request was successfully created.' }
        format.json { render :show, status: :created, location: @application_request }
      else
        format.html { render :new }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_request
      @application_request = ApplicationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_request_params
      params.require(:application_request).permit(:state, :authorized_at, :professor_id)
    end
end
