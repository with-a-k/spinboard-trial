require 'rails_helper'

RSpec.feature "UserSignouts", type: :feature do
  scenario "user can sign out from links index" do
    visit new_user_path
    fill_in :user_name, with: "sans"
    fill_in :user_email, with: "sans@under.net"
    fill_in :user_password, with: "shin-gles"
    fill_in :user_password_confirmation, with: "shin-gles"
    click_on "Create User"
    expect(current_path).to eq(links_path)
    expect(page).to have_content "Sign Out"
    click_on "Sign Out"
    expect(current_path).to eq(root_path)
  end
end
