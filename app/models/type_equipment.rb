class TypeEquipment < ApplicationRecord
  validates :name, :type, presence: true

  has_many :equipment
end
