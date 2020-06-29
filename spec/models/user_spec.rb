require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    describe 'email' do
      context 'when it is empty' do
        it 'is not valid' do
          expect(User.new(password: '123456', username: 'testing', full_name: 'newUser').valid?).to be_falsey
        end
      end

      context 'when it is present but incorrect' do
        it 'is not valid' do
          expect(User.new(password: '123456', username: 'testing', full_name: 'newUser', email: 'testingmail.com').valid?).to be_falsey
        end
      end

      context 'when it is present and correct' do
        it 'is valid' do
          user = User.new(password: '123456', username: 'testing22', full_name: 'newUser22', email: 'testing22@mail.com')
          expect(user.valid?).to be_truthy
        end
      end
    end#email

    describe 'full_name' do
      context 'when it is empty' do
        it 'is not valid' do
          expect(User.new(password: '123456', username: 'testing', email: 'testing@mail.com').valid?).to be_falsey
        end
      end

      context 'when it is present' do
        it 'is valid' do
          expect(User.new(password: '123456', username: 'testing', full_name: 'newUser', email: 'testing@mail.com').valid?).to be_truthy
        end
      end
    end#full_name

    describe 'username' do
      context 'when it is empty' do
        it 'is not valid' do
          expect(User.new(password: '123456', email: 'testing@mail.com', full_name: 'newUser').valid?).to be_falsey
        end
      end

      context 'when it is present' do
        it 'is valid' do
          expect(User.new(password: '123456', username: 'testing', email: 'testing@mail.com', full_name: 'newUser' ).valid?).to be_truthy
        end
      end
    end#username

    describe 'password' do
      context 'when it is empty' do
        it 'is not valid' do
          expect(User.new(username: 'testing', email: 'testing@mail.com', full_name: 'newUser').valid?).to be_falsey
        end
      end

      context 'when it is present but legth less than 6' do
        it 'is not valid' do
          expect(User.new(password: '12345', username: 'testing', email: 'testing@mail.com', full_name: 'newUser').valid?).to be_falsey
        end
      end

      context 'when it is present' do
        it 'is valid' do
          expect(User.new(password: '123456', username: 'testing', email: 'testing@mail.com',full_name: 'newUser').valid?).to be_truthy
        end
      end
    end#password

    describe 'user methods' do
      let(:user1) { User.create(username: 'user1', full_name: 'some user1', email: 'some@mail.com', password: '123456') }
      let(:user2) { User.create(username: 'user2', full_name: 'some user2', email: 'some2@mail.com', password: '123456') }
      let(:user3) { User.create(username: 'user3', full_name: 'some user3', email: 'some3@mail.com', password: '123456') }
      
      describe 'already_followed?' do
        context 'not follow' do        
          it 'ruturn false' do
            expect(user1.already_followed?(user2)).to be_falsey
          end
        end
        
        context 'is follow' do        
          it 'return true' do
            Follow.create(user_id: user1.id, following_id: user3.id)
            expect(user1.already_followed?(user3)).to be_truthy
          end
        end
      end#already_followed?

      describe 'search' do
        context 'not found' do
          it 'return a empty array' do
            expect(User.search('other')).to eq([])
          end
        end

        context 'found' do
          it 'return a user array' do
            expect(User.search('user1')).to eq([user1])
          end
        end
      end
    end

  end
end
