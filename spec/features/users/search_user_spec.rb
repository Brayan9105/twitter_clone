require 'rails_helper'

RSpec.describe 'Search user', type: :feature do
  before do
    @user = User.create(username: 'user1', full_name: 'some user1', email: 'some@mail.com', password: '123456')
            User.create(username: 'user2', full_name: 'juan carlos', email: 'some2@mail.com', password: '123456')
  end

  describe 'search user' do
    before(:each) do
      visit '/users/sign_in'
      fill_in 'Email', with: 'some@mail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      visit '/search_user'
    end

    scenario 'visit search_user' do
      expect(page).to have_http_status(200)
      expect(page).to have_current_path('/search_user')
    end

    # scenario 'click on search' do
    #   fill_in 'Username', with: 'j'
    #   click_on 'Search'
    #   expect(page).to have_content('juan')
    # end
  end
end