class Material < ApplicationRecord
  validates :amount, presence: true

  belongs_to :type_material
  has_many :visit
end
