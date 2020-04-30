class User < ApplicationRecord
  has_secure_password
  has_many :patients

  with_options if: :omniauth_uid_blank? do |u|
    u.validates :username, :name, :post_nominals, presence: true
    u.validates :username, format: {
      with: /\w{4,}/,
      message: "must consist of at least 4 characters; only letters, numbers, and underscores are allowed"}
    u.validate :username_taken?
  end

  # this helps trigger native-user validations if the User was not created from an OmniAuth hash.
  def omniauth_uid_blank?
    self.omniauth_uid.blank?
  end

  # this filters the Users down to those that have native usernames (i.e. not Oauth users), then checks uniqueness against that subset. Prevents "Username already in use" from appearing in addition to "Username can't be blank" when a blank username is attempted; Oauth users do not have, nor need, username. A blank username field would have been additionally flagged as "already in use" when "can't be blank" is enough.
  def username_taken?
    errors.add(:username, "is already in use") if
      User.all.select {|u| !u.username.blank?}
      .detect {|u| u.username == self.username}
  end

  def display_name
    if self.post_nominals
      self.name + ', ' + self.post_nominals
    else
      self.name
    end
  end


end
