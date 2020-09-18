class User < ApplicationRecord
  extend ActiveModel::Naming
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: { case_sensitive:false }, length: { minimum: 9 }
  has_secure_password
end