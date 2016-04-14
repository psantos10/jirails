# spec/features/admin_add_user_to_a_project_spec.rb
require 'rails_helper'

RSpec.feature 'Admin add user to a project', type: :feature do
  let(:admin) { create(:admin_user) }
  #let(:user) { create(:user) }
  let(:project) { create(:project) }

  before do
    login_as(admin)
  end

  scenario 'add user to the project' do
    user = create(:user)
    user2 = create(:user)

    visit project_path(project.id)

    click_link 'Settings'
    click_link 'Add user'

    select "#{user.name}", from: 'user_id', match: :first
    click_button 'Add user'

    click_link 'Members'
    expect(page).to have_content(user.name)
  end
end
