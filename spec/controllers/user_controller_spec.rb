require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # feature 'Updating account' do
  #   background do
  #     @user2 = User.create!(username: "Example User2", email: "user@example.com",
  #                           password: "Foobar1234", password_confirmation: "Foobar1234")
  #   end
  #   scenario 'Updating name', :sidekiq_inline do
  #     visit edit_user_path(@user2.id)
  #     patch 'update', params: { username: "New name", email: "user@example.com", current_password: "Foobar1234"}
  #   end
  # end
  #=============================================================================================
  let(:user_here) { User.create!(username: "Example User2", email: "user@example.com",
                                 password: "Foobar1234", password_confirmation: "Foobar1234") }

  describe "using valid data" do
    it "updates the request" do
      patch :update, params: { username: "New name", email: "user@example.com", current_password: "Foobar1234"}
      specify { expect(response).to redirect_to(sign_in_path) }
      it { should_not have_selector('div.alert.alert-notice', text: 'Need to be logged in') }
    end
  end
end
