# spec/features/admin_creates_new_project_spec.rb
require 'rails_helper'

RSpec.feature 'admin creates new project', type: :feature do
  let(:admin) { create(:admin_user) }
  let(:user) { create(:user) }

  let(:project) { build(:project) }

  scenario 'admin creates public project' do
    create_project_steps(false)
    expect(page).to have_content(project.name)
    expect(page).to have_content("Visibility: Public")
    logout(admin)
  end

  scenario 'admin creates private project' do
    create_project_steps(true)
    expect(page).to have_content(project.name)
    expect(page).to have_content("Visibility: Private")
    logout(admin)
  end

  scenario 'user cant create project' do
    login_as(user)
    visit new_project_path
    expect(page).to have_content("You don't have permission to access this feature")
    logout(user)
  end

  def create_project_steps(is_private = false)
    login_as(admin)
    visit new_project_path
    fill_in 'Name', with: project.name
    fill_in 'Description', with: project.description
    if is_private
      check 'project_is_private'
    else
      uncheck 'project_is_private'
    end
    click_button 'Create Project'
  end

end
