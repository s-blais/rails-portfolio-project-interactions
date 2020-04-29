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

end
