class User < ApplicationRecord
  has_secure_password
  has_many :patients

  def display_name
    self.name + ', ' + self.post_nominals
  end


end
