class MedicationsController < ApplicationController

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(medication_params)
    @medication.save
    redirect_to medication_path(@medication)
  end

  def show
    @medication = Medication.find_by_id(params[:id])
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :trade_names)
  end

end