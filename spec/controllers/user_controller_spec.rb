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
  # let(:user_here) { User.create!(username: "Example User2", email: "user@example.com",
  #                                password: "Foobar1234", password_confirmation: "Foobar1234") }
  # describe "using valid data" do
  #   it "updates the request" do
  #     patch :update, params: { username: "New name", email: "user@example.com", current_password: "Foobar1234"}
  #     specify { expect(response).to redirect_to(sign_in_path) }
  #     it { should_not have_selector('div.alert.alert-notice', text: 'Need to be logged in') }
  #   end
  # end
  #=============================================================================================
  # before do
  #   @user2 = User.new(username: "Example_Name", email: "user2@example.com",
  #                    password: "Foobar1234", password_confirmation: "Foobar1234")
  # end
  # subject { @user2 }
  # byebug
  #=============================================================================================
  # let(:user_here) { User.create!(username: "Example User2", email: "user@example.com",
  #                                password: "Foobar1234", password_confirmation: "Foobar1234") }
  #=============================================================================================
  #subject(:test_user) { FactoryBot.build(:test_user, email: email) }
  #@user_here = FactoryBot.build(:test_user)
  #subject { @user_here }
  # before(:all) { 
  #   @user_here = FactoryBot.create(:test_user)
  #   byebug
  # }
  #subject { @user_here }
  # describe "using valid data" do
  #   @user_here = FactoryBot.create!(:test_user)
  #   context "#update" do
  #     before { patch :update, params: {id: @user_here.id, user: {username: "New_name", current_password: "Foobar1234"}}}
  #     @user_here.reload
  #     @user_here.username.should eq("New_name")
  #   end
  # end
  #==============================================================================================
  #   let(:user_here) { User.create!(username: "Example User2", email: "user@example.com",
  #                                  password: "Foobar1234", password_confirmation: "Foobar1234") }

  #   describe '#update' do
  #     before { patch :update, params: {id: user_here.id, user: {username: "New_name", email: "user@example.com", current_password: "Foobar1234"}}}
  #     byebug
  #     context 'with vaild data' do
  #       it 'should eq to new name' do
  #         byebug
  #         expect(user_here.reload.username).to eq("new_name")
  #       end
  #     end
  #   end
  #================================================================================================
  # let(:user_here) { User.create!(username: "Example User2", email: "user@example.com",
  #                               password: "Foobar1234", password_confirmation: "Foobar1234") }
  # it "changes @user's new_email" do
  #   put :update, params: {id: user_here.id, user: {username: "New_name", email: "user@example.com", current_password: "Foobar1234"}}#user: attributes_for(:user_here, username: "New_name", email: "new@email.com")
  #   user_here.reload
  #   expect(user_here.username).to eq("new_name")
  #   expect(user_here.email).to eq("user@email.com")
  # end
  #================================================================================================
  # before(:all) do
  #   @user_here = FactoryBot.build(:test_user)
  # end

  # describe "PUT update/:id" do
  #   let(:attr) do 
  #     { :username => 'New_name', :email => 'new@example.com', :current_password => "Foobar1234" }
  #   end
  
  #   before(:all) do
  #     patch :update, params: {id: @user_here.id, user: attr}#:id => @user_here.id, :user_here => attr
  #     @user_here.reload
  #   end
  
  #   it { expect(response).to redirect_to(@user_here) }
  #   it { expect(@user_here.username).to eql attr[:username] }
  #   it { expect(@user_here.email).to eql attr[:email] }
  # end
  #==================================================================================================
  before(:all) do
    @user_here = User.create!(username: "Example User2", email: "user@example.com",
                              password: "Foobar1234", password_confirmation: "Foobar1234")
  end
  it 'checks that a user can be updated' do
    patch :update, params: {id: @user_here.id, user: {username: "New_name", email: "user@example.com", current_password: "Foobar1234"}}#user: attributes_for(:user_here, username: "New_name", email: "new@email.com")
    expect(@user_here.reload.email).to eq("user@example.com")
    expect(@user_here.reload.username).to eq("new_name")
    #@user_here.update(:username => "new_name")
    #expect(User.find_by_username("new_name")).to eq(@user_here)
  end

end
