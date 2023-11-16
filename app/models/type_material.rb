class TypeMaterial < ApplicationRecord
  validates :code, :unit, :name, presence: true

  has_many :material
end
