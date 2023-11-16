class TypeWorkOrder < ApplicationRecord
  validates :description, presence: true
end
