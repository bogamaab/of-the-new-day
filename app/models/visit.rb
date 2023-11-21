class Visit < ApplicationRecord
  include AASM

  enum status: [:assing, :progress, :complete, :cancel, :reschedule]

  validates_presence_of :timeslots, :start_visit, :end_visit, :quality, presence: true

  belongs_to :client
  belongs_to :material
  belongs_to :equipment
  belongs_to :work_order
  belongs_to :technician

  aasm column: :status do
    state :assign, initial: true
    state :progress
    state :cancel
    state :reschedule
    state :complete

    event :in_progress do
      transitions from: :assign, to: :progress
    end

    event :cancelled do
      transitions from: :assign, to: :cancel
    end

    event :rescheduled do
      transitions from: :progress, to: :rescheduled
    end

    event :completed do
      transitions from: :progress, to: :complete
    end
  end
end
