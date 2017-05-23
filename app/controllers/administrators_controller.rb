class AdministratorsController < ApplicationController

  before_filter :authenticate_administrator!
  before_action :set_current_administrator, only: [:edit, :show, :update_password, :edit_password, :home]
  before_action :set_administrator, only: [:update, :destroy]

  layout "unal"

  # GET /administrators
  # GET /administrators.json
  def index
    @administrators = Administrator.all
  end

  def update_password
    if @administrator.update_with_password(administrator_password_params)
      @administrator.update(first_update: true)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@administrator)
      redirect_to home_route
    else
      render administrator_edit_password_path
    end
  end

  def edit_password
  end

  # GET /administrators/1
  # GET /administrators/1.json
  def show
  end

  def home
    redirect_to administrator_edit_password_path unless @administrator.first_update
  end

  # GET /administrators/new
  def new
    @administrator = Administrator.new
  end

  # GET /administrators/1/edit
  def edit
  end

  # POST /administrators
  # POST /administrators.json
  def create
    @administrator = Administrator.new(administrator_params)

    respond_to do |format|
      if @administrator.save
        format.html { redirect_to @administrator, notice: 'Administrator was successfully created.' }
        format.json { render :show, status: :created, location: @administrator }
      else
        format.html { render :new }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administrators/1
  # PATCH/PUT /administrators/1.json
  def update
    respond_to do |format|
      if @administrator.update(administrator_params)
        format.html { redirect_to @administrator, notice: 'Administrator was successfully updated.' }
        format.json { render :show, status: :ok, location: @administrator }
      else
        format.html { render :edit }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrators/1
  # DELETE /administrators/1.json
  def destroy
    @administrator.destroy
    respond_to do |format|
      format.html { redirect_to administrators_url, notice: 'Administrator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    def set_current_administrator
      @administrator = Administrator.find(current_administrator.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_params
      params.require(:administrator).permit(:username, :first_name, :last_name, :email)
    end

    def administrator_password_params
      params.require(:administrator).permit(:password, :password_confirmation, :current_password)
    end
end
