# spec/features/user_sign_in_spec.rb
require 'rails_helper'

RSpec.feature 'User sign in', type: :feature do
  let(:user) { create :user }

  # Let's create our first scenario
  # User should login with a valid credentials (email, password)
  scenario 'with valid credentials' do
    sign_in_steps
    expect(page).to have_content("Welcome back, #{user.name}!")
    expect(page).to have_content("Sign out")
  end

  scenario 'with invalid credentials' do
    user.email = 'invalid@jirails.com'
    sign_in_steps
    expect(page).to have_content('Sign in')
  end

  def sign_in_steps
    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end
end
