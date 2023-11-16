require 'rails_helper'

RSpec.describe Equipment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:serial) }
  end

  describe 'associations' do
    it { should belong_to(:type_equipment) }
  end
end
