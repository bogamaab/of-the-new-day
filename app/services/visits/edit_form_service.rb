# frozen_string_literal: true

module Visits::EditFormService
  include FormService

  ATTRIBUTES = %i[timeslots start_visit end_visit quality reschedule]

  TYPES_OF_ATTRIBUTES = { timeslots: :string, start_visit: :datetime, end_visit: :datetime, quality: :integer,
                          reschedule: :boolean}

  LABEL_CLASSES = {}
end
