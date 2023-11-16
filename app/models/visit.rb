class Visit < ApplicationRecord
  validates_presence_of :timeslots, :start_visit, :end_visit, :quality,
    :reschedule, presence: true

  belongs_to :client
  belongs_to :material
  belongs_to :equipment
  belongs_to :work_order
  belongs_to :technician
end
