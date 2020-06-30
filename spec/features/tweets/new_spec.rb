require 'rails_helper'

RSpec.describe 'New tweet', type: :feature do
  before do
    @user = User.create(username: 'user1', full_name: 'some user1', email: 'some@mail.com', password: '123456')
  end

  describe 'new tweet' do
    before(:each) do
      visit '/users/sign_in'
      fill_in 'Email', with: 'some@mail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      visit '/tweets/new'
    end

    scenario 'visit tweets/new' do
      expect(page).to have_http_status(200)
      expect(page).to have_current_path('/tweets/new')
    end

    scenario 'click on tweet without body text' do
      click_on 'tweet'
      expect(page).to have_http_status(200)
      expect(page).to have_current_path('/tweets')
    end

    scenario 'click on tweet' do
      fill_in 'Body', with: 'my first tweet'
      click_on 'tweet'
      expect(page).to have_http_status(200)
      expect(page).to have_current_path('/')
      expect(page).to have_content('my first tweet')
    end
  end

end