require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'actions' do
    before(:each) do
      @user = User.create(username: 'user1', full_name: 'some user1', email: 'some@mail.com', password: '123456')
    end

    describe 'GET new' do
      context 'with authenticate user' do
        before(:each) do
          sign_in @user
        end

        it 'return a 200 status' do
          get :new
          expect(response).to have_http_status(200)
        end

        it 'render new view' do
          get :new
          expect(response).to render_template(:new)
        end
      end

      context 'without authenticate user' do
        it 'return a 302 status' do
          get :new
          expect(response).to have_http_status(302)
        end
      end
    end

    describe 'POST create' do
      it 'create and redirect' do
        sign_in @user
        post :create, params: {tweet: {body: 'some text', user: @user}}
        expect(response).to have_http_status(302)
      end
    end
  end
end