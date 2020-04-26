class Medication < ApplicationRecord
  has_many :prescriptions
  has_many :patients, through: :prescriptions

  def self.all_alpha
    all.sort_by {|m| m[:name]}
  end


end
