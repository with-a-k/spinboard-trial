require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  scenario "can log in from root with no logged in user" do
    visit root_path
    click_on "Log In"
    expect(page).to have_content("Log In As Existing User")
  end

  scenario "kicked back to form with incorrect login" do
    visit login_path
    fill_in :email, with: "everyonesmom@under.net"
    fill_in :password, with: "edaMOME"
    fill_in :password_confirmation, with: "edaMOM3"
    click_on "Log In"
    expect(page).to have_content("That didn't work. Check your email and password again.")
  end

  scenario "succeeds with correct login" do
    User.create(name: "Toriel", email: "everyonesmom@under.net", password: "edaMOM3", password_confirmation: "edaMOM3")
    visit login_path
    fill_in :email, with: "everyonesmom@under.net"
    fill_in :password, with: "edaMOM3"
    fill_in :password_confirmation, with: "edaMOM3"
    click_on "Log In"
    expect(current_path).to eq(links_path)
  end
end
