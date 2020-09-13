class User < ApplicationRecord
  extend ActiveModel::Naming
  validates :name, presence: true
  validates :email, presence: true, email: true, uniqueness: { case_sensitive:false }
  has_secure_password
end