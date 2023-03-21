class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :goal

  validates :name, presence: true
end
