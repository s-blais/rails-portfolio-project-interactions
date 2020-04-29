class PrescriptionsController < ApplicationController

  before_action :require_login

  def index
    @medications = Prescription.all_unique_by_medication
    @prescriptions_count = Prescription.all_tally_by_medication
  end

  # def new (nested only)
  def new
    @patient = Patient.find_by_id(params[:patient_id])
    @prescription = Prescription.new(patient_id: params[:patient_id])
  end

  def create
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
      redirect_to patient_path(@prescription.patient_id)
    else
      @patient = Patient.find_by_id(@prescription.patient_id)
      # wow that took some figuring out but it works – to prevent @patient from being nil upon rendering :new with errors! (would keeping all prescription routes nested have prevented this?)
      render :new
    end
  end

  # there's no show because it's provided in patients#show

  def edit
    @prescription = Prescription.find_by_id(params[:id])
    redirect_to patient_path(params[:patient_id]) unless my_patient?(@prescription.patient)
  end

  def update
    @prescription = Prescription.find_by_id(params[:id])
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
    @prescription = Prescription.find_by_id(params[:id])
    @prescription.destroy if my_patient?(@prescription.patient)
    redirect_to patient_path(@prescription.patient)
  end

  private

  def prescription_params
    params.require(:prescription).permit(:patient_id, :medication_id, :dose, :frequency)
  end


end