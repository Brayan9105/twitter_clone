require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe 'validations' do
    let(:user1) { User.create(username: 'user1', full_name: 'some user1', email: 'some@mail.com', password: '123456') }
    let(:user2) { User.create(username: 'user2', full_name: 'some user2', email: 'some2@mail.com', password: '123456') }

    describe 'follow' do
      context 'user1 follow user2' do
        it 'is ok' do
          follow = Follow.new(user_id: user1.id, following_id: user2.id)
          expect(follow.valid?).to be_truthy
        end
      end
    end
  end
end
