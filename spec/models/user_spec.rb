require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'validations' do
    it { expect(user).to be_valid }
  end

  describe 'associations' do
    it { should have_many(:projects).through(:members) }
  end
  
end
