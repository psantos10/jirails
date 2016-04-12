# spec/features/user_sign_in_spec.rb
require 'rails_helper'

RSpec.feature 'User sign in', type: :feature do
  let(:user) { create :user }

  # Let's create our first scenario
  # User should login with a valid credentials (email, password)
  scenario 'with valid credentials' do
    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'

    expect(page).to have_content("Welcome back, #{user.name}!")
  end
end
