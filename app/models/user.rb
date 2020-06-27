class User < ApplicationRecord
  has_many :tweets
  
  has_many :follows

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  validates :username, :email, :full_name, presence: true
  validates :email, :username, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def already_followed?(user_id)
    self.following.where("following_id = ?", user_id).exists?
  end

  def self.search(username)
    username.downcase!
    username.strip!
    where("username like ?", "#{username}%")
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end
end
