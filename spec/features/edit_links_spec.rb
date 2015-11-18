require 'rails_helper'

RSpec.feature "EditLinks", type: :feature do
  scenario "edit buttons take you to edit page" do
    user = User.create(name: "Undyne", email: "strongfish@under.net", password: "animeisreal", password_confirmation: "animeisreal")
    link = user.links.create(title: "THE HARD QUESTIONS", location: "http://i.imgur.com/oRH2KBP.jpg")
    visit login_path
    fill_in :email, with: "strongfish@under.net"
    fill_in :password, with: "animeisreal"
    fill_in :password_confirmation, with: "animeisreal"
    click_on "Log In"
    click_on "Edit Link"
    expect(current_path).to eq(edit_link_path(link))
  end

  scenario "change the title and location of a link" do
    user = User.create(name: "Undyne", email: "strongfish@under.net", password: "animeisreal", password_confirmation: "animeisreal")
    link = user.links.create(title: "THE HARD QUESTIONS", location: "http://i.imgur.com/oRH2KBP.jpg")
    visit login_path
    fill_in :email, with: "strongfish@under.net"
    fill_in :password, with: "animeisreal"
    fill_in :password_confirmation, with: "animeisreal"
    click_on "Log In"
    click_on "Edit Link"
    fill_in :link_title, with: "BETER QUALITY"
    fill_in :link_location, with: "http://41.media.tumblr.com/b15164493ec3343daffe3233ec820e20/tumblr_inline_ny0tmtW1hD1qgs7sn_500.png"
    click_on "Update Link"
    expect(current_path).to eq(links_path)
    expect(page).to have_content("BETER QUALITY")
    expect(page).not_to have_content("THE HARD QUESTIONS")
  end

  scenario "rejects change if the new location is invalid" do
    user = User.create(name: "Undyne", email: "strongfish@under.net", password: "animeisreal", password_confirmation: "animeisreal")
    link = user.links.create(title: "THE HARD QUESTIONS", location: "http://i.imgur.com/oRH2KBP.jpg")
    visit login_path
    fill_in :email, with: "strongfish@under.net"
    fill_in :password, with: "animeisreal"
    fill_in :password_confirmation, with: "animeisreal"
    click_on "Log In"
    click_on "Edit Link"
    fill_in :link_title, with: "BETER QUALITY"
    fill_in :link_location, with: "http://41.media.tumblr.com/ b15164493ec3343daffe3233ec820e20/tumblr_inline_ny0tmtW1hD1qgs7sn_500.png"
    click_on "Update Link"
    expect(current_path).to eq(edit_link_path(link))
    
  end
end
