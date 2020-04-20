class User < ApplicationRecord
  has_secure_password
  has_many :patients

  def display_name
    if self.post_nominals
      self.name + ', ' + self.post_nominals
    else
      self.name
    end
  end


end
