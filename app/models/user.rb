class User < ApplicationRecord
  has_secure_password
  has_many :permissions, dependent: :destroy
  has_many :projects
end
