class PatientsController < ApplicationController

  before_action :require_login

  def index
    if params[:user_id] # && user_id validator
      @user = User.find_by_id(params[:user_id])
      @patients = Patient.provider_scope(params[:user_id])
    else
      @patients = Patient.all
    end
  end

  def new
    # add user_id exist & self validator
    @patient = Patient.new(user_id: params[:user_id])
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  def show
    @patient = Patient.find_by_id(params[:id])
    @interactions = @patient.interaction_matches
  end
  
  def edit
    # add user_id validator ?
    # allow Provider to switch ownership to another Provider?
    @patient = Patient.find_by_id(params[:id])
    redirect_to patient_path(@patient) if !my_patient?(@patient)
  end
  
  def update
    @patient = Patient.find_by_id(params[:id])
    if my_patient?(@patient)
      if @patient.update(patient_params)
        redirect_to patient_path(@patient)
      else
        render :edit
      end
    else
      redirect_to patient_path(@patient)
    end
  end
      
  def destroy
    @patient = Patient.find_by_id(params[:id])
    redirect_to patient_path(@patient) if !my_patient?(@patient)
    @patient.destroy
    # added dependent: :destroy to Patient's has_many :prescriptions so a patient's prescriptions will be destroyed when the patient is destroyed
    redirect_to user_patients_path(current_user)
  end

  private

  def patient_params
    params.require(:patient).permit(:user_id, :first_name, :last_name, :birthdate)
  end

end