class Tweet < ApplicationRecord
  belongs_to :user
  validates :body, length: {minimum: 1, maximum: 280}

  self.per_page = 10
end
