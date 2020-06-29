require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'validations' do
    let(:user) { User.create(password: '123456', username: 'testing', full_name: 'newUser', email: 'testing@mail.com') }
    
    describe 'body' do
      context 'when it length is less than 1' do
        it 'is not valid' do
          expect(Tweet.new(body: '', user: user).valid?).to be_falsey
        end
      end
      
      context 'when it length is more than 280' do
        it 'is not valid' do
          expect(Tweet.new(body: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many', 
                           user: user).valid?).to be_falsey
        end
      end
      
      context 'when it is corret' do
        it 'is valid' do
          expect(Tweet.new(body: 'abc', user: user).valid?).to be_truthy
        end
      end
    end
  end
end
