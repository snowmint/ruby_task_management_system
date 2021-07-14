require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # let(:user_here) { User.create!(username: "Example User2", email: "user@example.com",
  #                           password: "Foobar1234", password_confirmation: "Foobar1234") }

  # describe "#update" do
  #   before { post :update, params: { user: user_here } }
  #   specify { expect(response).to redirect_to(sign_in_path) }
  #   it { should_not have_selector('div.alert.alert-notice', text: 'Need to be logged in') }
  # end
  feature 'Updating account' do
    background do
      @user2 = User.create!(username: "Example User2", email: "user@example.com",
                            password: "Foobar1234", password_confirmation: "Foobar1234")
    end
    # describe "#update" do
    #   before { patch :update, username: "New name", email: "user@example.com", current_password: "Foobar" }
    #   #post :update, { user: { username: "New name", email: "user@example.com", current_password: "Foobar1234"} }
    #   #click_button raw(t('user_relate.' + locals_for_translate))
    #   #expect(current_path).to eq edit_user_path
    #   expect(page).to have_text I18n.t('user_relate.add_success')
    #   #specify { expect(response).to redirect_to(sign_in_path) }
    #   #it { should_not have_selector('div.alert.alert-notice', text: 'Need to be logged in') }
    # end
  #end
    #visit edit_user_path(@user.id)
    #fill_in 'username', with: 'New Name'
    #post :update, { params: { username: "New name", email: "user@example.com", current_password: "Foobar1234"} }
    #click_button raw(t('user_relate.' + locals_for_translate))
    #visit edit_user_path(@user)
    # fill_in 'post_name', with: 'Testing Article'
    # click_button 'Update Post'
    
    scenario 'Updating name', :sidekiq_inline do
      visit edit_user_path(@user2.id)
      post 'update', params: { username: "New name", email: "user@example.com", current_password: "Foobar1234"}
    # #   within('form') do
    # #     fill_in 'user_username', with: 'New name'
    # #     fill_in 'user_email', with: 'user@example.com'
    # #     fill_in_'user_current_password', with: 'Foobar1234'
    # #   end
    #   #find_field('username').set('New name')
    #   #find_field('email').set('user@example.com')
    #   #find_field('current_password').set('Foobar1234')
    #   #fill_in 'email', with: 'user@example.com'
    #   #fill_in 'current_password', with: "Foobar1234"
  
    #   #click_button raw(t('user_relate.' + locals_for_translate)) #'Save changes'
  
    #   expect(current_path).to eq edit_user_path
    #   expect(page).to have_text 'Your account has been updated successfully.'
    end
  end
end
