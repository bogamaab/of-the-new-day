class TypeEquipment < ApplicationRecord
  validates :name, :type, presence: true
end
