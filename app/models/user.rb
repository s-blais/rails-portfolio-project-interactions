class User < ApplicationRecord
  has_secure_password

  def display_name
    self.name + ' ' + self.post_nominals
  end


end
