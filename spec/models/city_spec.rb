require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { have_many(:user) }
    it { have_many(:client) }
  end
end
