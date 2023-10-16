class Theme < ApplicationRecord
  has_many :exercises, dependent: :destroy
end
