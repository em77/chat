require "rails_helper"

feature "chat rooms", type: :feature do
  before do
    FactoryBot.create(:user)
  end

  scenario "user can create and chat in a chat room", js: true do
    visit login_path
    fill_in "Name", with: "Fellow Human"
    fill_in "Password", with: "password"
    click_button "Login"

    click_link "New Chat Room"
    fill_in "Name", with: "The Break Room"
    click_on "Create Chat room"

    click_link "The Break Room"

    fill_in "chat_room_speaker", with: "iChat"
    find_field("chat_room_speaker").native.send_keys(:return)
    fill_in "chat_room_speaker", with: "and I chat again"
    find_field("chat_room_speaker").native.send_keys(:return)
    expect(page).to have_content "Fellow Human: iChat"
    expect(page).to have_content "Fellow Human: and I chat again"

    click_link "Back to Chat Rooms"

    click_link "The Break Room"

    expect(page).to have_content "Fellow Human: iChat"
    expect(page).to have_content "Fellow Human: and I chat again"
  end
end
