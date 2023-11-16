require 'rails_helper'

RSpec.describe TypeMaterial, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:unit) }
    it { should validate_presence_of(:name) }
  end

#  describe 'associations' do
#    it { should have_many(:material) }
#  end
end
