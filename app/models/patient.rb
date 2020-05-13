class Patient < ApplicationRecord
  belongs_to :user
  has_many :prescriptions, dependent: :destroy
  has_many :medications, through: :prescriptions

  validates :first_name, :last_name, presence: true
  validates :birthdate, format: {
    with: /\d{4}-\d{2}-\d{2}/,
    message: "must be in format YYYY-MM-DD"
  }

  validates :first_name, uniqueness: {
    scope: [:last_name, :birthdate],
    message: ", last name, and birthdate combination must not already exist in patient database"
  }

  scope :provider_scope, -> (id){where("user_id = ?", id)}

  def age
    now = Time.now.utc.to_date
    dob = self.birthdate
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def display_name
    self.first_name + ' ' + self.last_name
  end

  # returns array of all pairings of currently prescribed medication ids to be compared against Interaction pairings
  def prescription_pairs
    seconds = self.medications.ids
    self.medications.ids.collect do |first|
      seconds.shift
      seconds.collect { |second| [first,second] }
    end
    .flatten(1)
  end

  # returns array of Interactions where the pair of medications in the Interaction match a pair in the patient's prescription_pairs
  def interaction_matches
    pairs = self.prescription_pairs
    Interaction.all.select do |i|
      pairs.include?([i.medication_1_id, i.medication_2_id]) || pairs.include?([i.medication_2_id, i.medication_1_id])
    end
  end

end

# removed "variable sandwich" for "pairs" and shorthanded the nested loop, old version below. Was also able to skip the patient_prescriptions_medication_ids method entirely, since it's simply self.medications.ids

# def patient_prescription_pairs
#   pairs = []
#   seconds = patient_prescriptions_medication_ids
#   patient_prescriptions_medication_ids.each do |first|
#     seconds.shift
#     seconds.each do |second|
#       pairs.push([first,second])
#     end
#   end
#   pairs
# end
