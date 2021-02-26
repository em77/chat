require "rails_helper"

feature "authentication", type: :feature do
  scenario "user can sign up and sign in", js: true do
    visit new_user_path
    fill_in "Name", with: "George"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create User"
    fill_in "Name", with: "George"
    fill_in "Password", with: "password"
    click_button "Login"
    expect(page).to have_content "Login successful"
  end
end
