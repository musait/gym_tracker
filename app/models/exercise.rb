class Exercise < ApplicationRecord
  belongs_to :theme
  has_many :workouts, dependent: :destroy
end
