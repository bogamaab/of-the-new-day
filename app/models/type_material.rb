class TypeMaterial < ApplicationRecord
  validates :code, :unit, :name, presence: true
end
