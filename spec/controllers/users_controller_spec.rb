require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'actions' do
    before(:each) do
      @user = User.create(username: 'user1', full_name: 'some user1', email: 'some@mail.com', password: '123456')
    end

    describe 'GET show' do
      context 'with authenticate user' do
        before(:each) do
          sign_in @user
        end

        it 'return a 200 status' do
          get :show, params: {user_id: 1}
          expect(response).to have_http_status(200)
        end

        it 'render show view' do
          get :show, params: {user_id: 1}
          expect(response).to render_template(:show)
        end
      end

      context 'without authenticate user' do
        it 'return a 302 status' do
          get :show, params: {user_id: 1}
          expect(response).to have_http_status(302)
        end
      end
    end
  end

end