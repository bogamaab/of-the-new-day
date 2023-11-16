require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:timeslots) }
    it { should validate_presence_of(:start_visit) }
    it { should validate_presence_of(:end_visit) }
    it { should validate_presence_of(:reschedule) }
    it { should validate_presence_of(:quality) }
  end

  describe 'associations' do
    it { should belong_to(:client) }
    it { should belong_to(:equipment) }
    it { should belong_to(:material) }
    it { should belong_to(:technician) }
    it { should belong_to(:work_order) }
  end
end
