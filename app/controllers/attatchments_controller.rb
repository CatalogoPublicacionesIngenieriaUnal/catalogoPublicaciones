class AttatchmentsController < ApplicationController
  before_action :set_attatchment, only: [:show, :edit, :update, :destroy]

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
    @attatchment.url = params[:file]
    respond_to do |format|
      if @attatchment.save
        format.html { redirect_to @attatchment, notice: 'Attatchment was successfully created.' }
        format.json { render :show, status: :created, location: @attatchment }
      else
        format.html { render :new }
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
    @attatchment.destroy
    respond_to do |format|
      format.html { redirect_to attatchments_url, notice: 'Attatchment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attatchment
      @attatchment = Attatchment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attatchment_params
      params.require(:attatchment).permit(:url, :category)
    end
end
