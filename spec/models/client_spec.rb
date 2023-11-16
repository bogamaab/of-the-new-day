require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:account_number) }
    it { should validate_presence_of(:contact_number) }
  end

  describe 'associations' do
    it { should belong_to(:city) }
  end
end
