class ApplicationRequestsController < ApplicationController
  before_action :set_application_request, only: [:show, :edit, :update, :destroy]

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

  # GET /application_requests/1/edit
  def edit
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

  # PATCH/PUT /application_requests/1
  # PATCH/PUT /application_requests/1.json
  def update
    respond_to do |format|
      if @application_request.update(application_request_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_request
      @application_request = ApplicationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_request_params
      params.require(:application_request).permit(:url, :created_at, :updated_at)
    end
end
