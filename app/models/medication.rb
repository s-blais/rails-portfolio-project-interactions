class Medication < ApplicationRecord
  has_many :prescriptions
  has_many :patients, through: :prescriptions
  has_many :interactions, foreign_key: :medication_1_id, class_name: "Interaction"
  has_many :interactions, foreign_key: :medication_2_id, class_name: "Interaction"

  validates_presence_of :name
  validates :name, uniqueness: true

  before_validation :downcase_fields

  def downcase_fields
    self.name.downcase!
  end

  def self.all_alpha
    all.sort_by {|m| m[:name]}
  end


end
