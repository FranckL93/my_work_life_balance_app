class User < ApplicationRecord

  has_many :goals, dependent: :destroy
  has_many :activities, through: :goals
  has_many :reminders, through: :goals

  # has_secure_password

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
