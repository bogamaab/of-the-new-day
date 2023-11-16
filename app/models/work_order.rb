class WorkOrder < ApplicationRecord
  validates :node, :failure_note, :closing_note, presence: true
  validates_length_of :marker, maximum: 9

  belongs_to :type_work_order
  has_one :visit, required: false
end
