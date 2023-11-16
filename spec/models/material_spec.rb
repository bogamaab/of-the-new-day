require 'rails_helper'

RSpec.describe Material, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:amount) }
  end

  describe 'associations' do
    it { should belong_to(:type_material) }
  end
end
