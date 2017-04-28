class ProfessorsController < ApplicationController

  before_action :set_professor, only: [:update, :destroy]
  before_action :set_current_professor, only: [:edit, :show]
  before_action :authenticate_administrator!, only: [:index, :destroy, :autorize]

  layout "unal"


  def not_authorized
  end
  # GET /professors
  # GET /professors.json
  def index
    # @professors = Professor.all
    @professors = Professor.search(params[:is_authorized]).page(params[:page]).per_page(5)
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
  end

  def home
    @professors = Professor.all
    @publications = Publication.all
  end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit
  end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Se ha creado el profesor.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_edit_params)
        format.html { redirect_to home_route }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to home_route }
      format.json { head :no_content }
    end
  end

  def autorize
    Professor.where(id: params[:professor_ids]).update_all(is_authorized: true)
    redirect_to home_route
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    def set_current_professor
      @professor = Professor.find(current_professor.id)
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:username, :first_name, :last_name, :email, :department, :contact_number, :gender, :is_authorized)
    end
    def professor_edit_params
      params.require(:professor).permit(:department, :contact_number, :gender)
    end
end
