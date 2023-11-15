class City < ApplicationRecord
  validates :description, presence: true

  has_many :user
end
