require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before do
    @user = User.create(username: 'user1', full_name: 'some user1', email: 'some@mail.com', password: '123456')
  end

  describe 'user show' do
    before(:each) do
      visit '/users/sign_in'
      fill_in 'Email', with: 'some@mail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      visit '/user1/tweets'
    end

    scenario 'visit user profile' do
      expect(page).to have_http_status(200)
      expect(page).to have_content('some user1')
      expect(page).to have_content('user1')
      expect(page).to have_content('tweets')
      expect(page).to have_content('Followers')
      expect(page).to have_content('Following')
      expect(page).to have_content('Tweet')
    end

    scenario 'click on Tweet' do
      first('.btn').click
      expect(page).to have_http_status(200)
      expect(page).to have_current_path('/tweets/new')
    end

    scenario 'click on Followers' do
      click_on 'Followers'
      expect(page).to have_http_status(200)
      expect(page).to have_current_path('/user1/followers')
    end

    scenario 'click on Following' do
      click_on 'Following'
      expect(page).to have_http_status(200)
      expect(page).to have_current_path('/user1/followings')
    end
  end
end