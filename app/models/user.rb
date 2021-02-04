class User < ApplicationRecord
  has_many :jobs
  has_many :steps, through: :jobs
  has_secure_password
end
