class PatientsController < ApplicationController

  before_action :require_login

  def index

  end

  def new
    # add user_id validator
    @patient = Patient.new(user_id: params[:user_id])
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save
    redirect_to patient_path(@patient)
  end

  def show
    @patient = Patient.find_by_id(params[:id])
  end

  def edit

  end

  def update

  end

  private

  def patient_params
    params.require(:patient).permit(:user_id, :first_name, :last_name, :birthdate)
  end

end