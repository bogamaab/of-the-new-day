require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:identification_number) }
    it { should validate_presence_of(:contact_number) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:identification_number).is_at_least(8).is_at_most(15) }
    it { should validate_length_of(:contact_number).is_at_least(7).is_at_most(10) }
  end

  describe '#full_name' do
    let(:user) { create(:user) }

    it 'Should return the full name user' do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
