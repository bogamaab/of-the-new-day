require 'rails_helper'

RSpec.describe WorkOrder, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:node) }
    it { should validate_presence_of(:failure_note) }
    it { should validate_length_of(:marker).is_at_most(9) }
    it { should validate_presence_of(:closing_note) }
  end

  describe 'associations' do
    it{ should belong_to(:type_work_order) }
    it{ should have_one(:visit).optional }
  end
end
