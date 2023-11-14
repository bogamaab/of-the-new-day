require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:admin_user) { create(:user, :with_admin) }
  #let!(:consultant) { create(:user, :with_consultant) }
  #let!(:technician) { create(:user, :with_technician) }

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

  describe '#is_admin?' do
    it 'Should return true when user is admin' do
      expect(admin_user.is_admin?).to be_truthy
    end

  #   xit 'Should return false when user is consultant' do
  #     expect(consultant.is_admin?).to be_falsey
  #   end

  #   xit 'Should return false when user is technician' do
  #     expect(technician.is_admin?).to be_falsey
  #   end
  end

  # describe '#is_consultant?' do
  #   it 'Should return true when user is consultant' do
  #     expect(consultant.is_consultant?).to be_truthy
  #   end

  #   it 'Should return false when user is admin' do
  #     expect(admin.is_consultant?).to be_falsey
  #   end

  #   it 'Should return false when user is technician' do
  #     expect(technician.is_consultant?).to be_falsey
  #   end
  # end

  # describe '#is_technician?' do
  #   it 'Should return true when user is technician' do
  #     expect(technician.is_technician?).to be_truthy
  #   end

  #   it 'Should return false when user is admin' do
  #     expect(admin.is_technician?).to be_falsey
  #   end

  #   it 'Should return false when user is consultant' do
  #     expect(consultant.is_technician?).to be_falsey
  #   end
  # end
end
