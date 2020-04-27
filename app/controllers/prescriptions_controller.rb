class PrescriptionsController < ApplicationController

  before_action :require_login

  # index is not needed because list of prescriptions and related links (new, edit) are included in patient show view
  # def index
  #   if params[:patient_id]
  #     @patient = Patient.find_by_id(params[:patient_id])
  #   end
  # end

  # def new (nested only)
  def new
    @patient = Patient.find_by_id(params[:patient_id])
    @prescription = Prescription.new(patient_id: params[:patient_id])
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.save
    redirect_to patient_path(@prescription.patient_id)
  end

  # there's no show because it's provided in patients#show

  # def edit (nested only?)

  # def update (nested only?)

  # def delete (nested only?)

  private

  def prescription_params
    params.require(:prescription).permit(:patient_id, :medication_id, :dose, :frequency)
  end


end