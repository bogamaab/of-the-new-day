class Equipment < ApplicationRecord
  validates :serial, presence: true

  belongs_to :type_equipment
  has_many :visit
end
