require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { build :project }
  let(:private_project) { build :private_project }

  it { expect(project).to be_valid }
  it { expect(private_project).to be_valid }

  it 'is invalid without a name' do
    project.name = nil
    expect(project).to be_invalid
  end

  it { should validate_uniqueness_of(:name).case_insensitive }

  describe "Associations" do
    it { should have_many(:users).through(:members) }
  end

  describe "#add_user" do
    it "return the number of users" do
      project = create(:project)
      user = create(:user)
      user2 = create(:admin_user)

      project.add_user(user)
      project.add_user(user2)

      expect(project.users.count).to eq 2
    end
  end

end
