require 'rails_helper'

RSpec.feature "UserSignups", type: :feature do
  scenario "Can visit signup from root with no user logged in" do
    visit root_path
    click_on "Sign Up"
    expect(page).to have_content("Register New User")
  end

  scenario "Can fill in form and register a new user" do
    visit root_path
    click_on "Sign Up"
    fill_in :user_name, with: "Chara"
    fill_in :user_email, with: "thefallenhuman@under.net"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_on "Create User"
    expect(current_path).to eq(links_path)
  end
end
