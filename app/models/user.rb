class User < ApplicationRecord
  extend ActiveModel::Naming
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }, length: { minimum: 9 }
  has_secure_password

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end