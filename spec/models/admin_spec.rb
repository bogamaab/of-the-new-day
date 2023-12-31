require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'validations' do
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:identification_number) }
    it { should respond_to(:contact_number) }
    it { should respond_to(:address) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
