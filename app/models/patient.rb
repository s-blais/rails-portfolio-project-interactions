class Patient < ApplicationRecord
  belongs_to :user

  def age
    now = Time.now.utc.to_date
    dob = self.birthdate
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def display_name
    self.first_name + ' ' + self.last_name
  end

end
