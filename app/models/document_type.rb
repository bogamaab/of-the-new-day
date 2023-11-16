class DocumentType < ApplicationRecord
  validates :description, presence: true

  #has_many :user
end
