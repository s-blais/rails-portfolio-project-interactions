class PrescriptionsController < ApplicationController

  before_action :require_login
  before_action :set_prescription, only: [:edit, :update, :destroy]

  def index
    @medications = Prescription.all_unique_by_medication
    @prescriptions_count = Prescription.all_tally_by_medication
  end

  def new
    @patient = Patient.find_by_id(params[:patient_id])
    if my_patient?(@patient)
      @prescription = Prescription.new(patient_id: params[:patient_id])
    else
      redirect_to patient_path(@patient)
    end
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @patient = Patient.find_by_id(@prescription.patient_id) # this is utilized for both the my_patient check and also so @patient is not nil if :new is re-rendered because of form save error
    if my_patient?(@patient)
      if @prescription.save
        redirect_to patient_path(@patient)
      else
        render :new
      end
    else
      redirect_to patient_path(@patient)
    end
  end

  # there's no show because it's provided in patients#show

  def edit
    redirect_to patient_path(params[:patient_id]) unless my_patient?(@prescription.patient)
  end

  def update
    if my_patient?(@prescription.patient)
      if @prescription.update(prescription_params)
        redirect_to patient_path(@prescription.patient)
      else
        render :edit
      end
    else
      redirect_to patient_path(@prescription.patient)
    end
  end

  def destroy
    @prescription.destroy if my_patient?(@prescription.patient)
    redirect_to patient_path(@prescription.patient)
  end

  private

  def prescription_params
    params.require(:prescription).permit(:patient_id, :medication_id, :dose, :frequency)
  end

  def set_prescription
    @prescription = Prescription.find_by_id(params[:id])
  end


end