require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user_here) { User.create!(username: "Example User2", email: "user@example.com",
                                password: "Foobar1234", password_confirmation: "Foobar1234") }

  it "didn't log in should not update" do
    put :update, params: {id: user_here.id, user: {username: "New_name", email: "user@email.com", current_password: "Foobar1234"}}
    expect(response).to redirect_to(login_path)
    should_not have_selector('div.alert.alert-notice', text: 'Need to be logged in')
  end
  it "changes @user's new_email" do
    request.session[:user_id] = user_here.id
    put :update, params: {id: user_here.id, user: {username: "New_name", email: "user@email.com", current_password: "Foobar1234"}}
    user_here.reload
    expect(user_here.username).to eq("new_name")
    expect(user_here.email).to eq("user@email.com")
  end

end
