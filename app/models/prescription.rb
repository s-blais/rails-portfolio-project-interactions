class Prescription < ApplicationRecord
  belongs_to :medication
  belongs_to :patient

  validates_presence_of :medication_id, :patient_id, :dose, :frequency

  validates :medication_id, uniqueness: {
    scope: :patient_id,
    message: "is already prescribed to this patient"}

  def self.all_alpha
    all.sort_by {|p| p.medication.name }
  end

  # upgrading to Ruby 2.7 for #tally might save some grief here!

  # pass in an argument for provider scoping, default is "all"?

  def self.all_unique_by_medication
    self.all_alpha.uniq{ |p| p.medication_id }
    .map { |p| p.medication }
  end

  def self.all_tally_by_medication
    all.group_by {|v| v.medication_id }
    .map { |k, v| [k, v.size] }
    .to_h
  end

end
