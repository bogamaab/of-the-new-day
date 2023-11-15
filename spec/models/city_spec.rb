require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:description) }
  end

  describe 'association' do
    it { have_one(:user) }
  end
end
