require 'rails_helper'

RSpec.describe 'Follower_user', type: :feature do
  before do
    @user = User.create(username: 'user1', full_name: 'some user1', email: 'some@mail.com', password: '123456')
    @user2 = User.create(username: 'user2', full_name: 'juan carlos', email: 'some2@mail.com', password: '123456')
            Follow.create(user_id: @user2.id, following_id: @user.id)
            Tweet.create(body: 'some text', user: @user2)
  end

  describe 'new tweet' do
    before(:each) do
      visit '/users/sign_in'
      fill_in 'Email', with: 'some@mail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      visit '/user1/followers'
    end

    scenario 'visit followers' do
      expect(page).to have_http_status(200)
      expect(page).to have_current_path('/user1/followers')
      expect(page).to have_content('juan carlos')
      expect(page).to have_content('user2')
    end
    
    scenario 'click on follow' do
      click_on 'Follow'
      expect(page).to have_http_status(200)
      expect(page).to have_content('juan carlos')
      expect(page).to have_content('user2')
      expect(page).to have_content('some text')
    end
  end
end