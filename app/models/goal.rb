class Goal < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :deadline, presence: true
  validates :status, presence: true
end
