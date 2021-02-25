require 'rails_helper'

RSpec.describe "ChatRooms", type: :request do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_user(user, user.password, user_sessions_create_path, :get)
  end

  describe "GET /show" do
    it "returns http success" do
      get "/chat_rooms/show"
      expect(response).to have_http_status(:success)
    end
  end

end
