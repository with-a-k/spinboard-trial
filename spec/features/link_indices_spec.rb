require 'rails_helper'

RSpec.feature "LinkIndices", type: :feature do
  scenario "see links" do
    user = User.create(name: 'PAPYRUS', email: 'COOLSKELETON95@UNDER.NET', password: 'SPAGHETTI', password_confirmation: 'SPAGHETTI')
    user.links.create(title: 'MY FAMOUS SPAGHETTI. DO NOT BELIEVE "JO MAMA"\'S LIES', location: 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CB4QFjAAahUKEwjRz7SY5JrJAhUPx2MKHYIfDJg&url=http%3A%2F%2Fwww.food.com%2Frecipe%2Fjo-mamas-world-famous-spaghetti-22782&usg=AFQjCNHC3T7hXBbzGRTvBbp0alQGN3H_CQ&sig2=7g8xMl4uf6BPVqwp2nVvRQ')
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: 'SPAGHETTI'
    fill_in :password_confirmation, with: 'SPAGHETTI'
    click_on "Log In"
    expect(page).to have_content('MY FAMOUS SPAGHETTI. DO NOT BELIEVE "JO MAMA"\'S LIES')
  end

  scenario "don't see other users' links" do
    user = User.create(name: 'PAPYRUS', email: 'COOLSKELETON95@UNDER.NET', password: 'SPAGHETTI', password_confirmation: 'SPAGHETTI')
    user.links.create(title: 'MY FAMOUS SPAGHETTI. DO NOT BELIEVE "JO MAMA"\'S LIES', location: 'https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CB4QFjAAahUKEwjRz7SY5JrJAhUPx2MKHYIfDJg&url=http%3A%2F%2Fwww.food.com%2Frecipe%2Fjo-mamas-world-famous-spaghetti-22782&usg=AFQjCNHC3T7hXBbzGRTvBbp0alQGN3H_CQ&sig2=7g8xMl4uf6BPVqwp2nVvRQ')
    user2 = User.create(name: 'sans', email: 'sans@under.net', password: 'shin-gles', password_confirmation: 'shin-gles')
    user2.links.create(title: 'use these later', location: 'http://www.buzzfeed.com/adamellis/punny-skeleton-comics-that-will-tickle-your-funny-bone#.axgLjOO0j')
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: 'SPAGHETTI'
    fill_in :password_confirmation, with: 'SPAGHETTI'
    click_on "Log In"
    expect(page).not_to have_content('use these later')
  end

  scenario "add a link" do
    user = User.create(name: 'PAPYRUS', email: 'COOLSKELETON95@UNDER.NET', password: 'SPAGHETTI', password_confirmation: 'SPAGHETTI')
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: 'SPAGHETTI'
    fill_in :password_confirmation, with: 'SPAGHETTI'
    click_on "Log In"
    fill_in :link_title, with: 'A NICE ARTICLE ON PUZZLE DESIGN.'
    fill_in :link_location, with: "http://gamasutra.com/blogs/AsherEinhorn/20150528/244577/Fourstep_puzzle_design.php"
    click_on "Create Link"
    expect(page).to have_content('A NICE ARTICLE ON PUZZLE DESIGN.')
  end
end
