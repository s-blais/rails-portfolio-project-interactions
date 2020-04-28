class MedicationsController < ApplicationController

  before_action :require_login

  def index
    @medications = Medication.all_alpha
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(medication_params)
    if @medication.save
      redirect_to medication_path(@medication)
    else
      render :new
    end
  end

  def show
    @medication = Medication.find_by_id(params[:id])
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :trade_names)
  end

end