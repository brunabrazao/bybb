class Post < ApplicationRecord
  belongs_to :feed
  belongs_to :user

  validates :body, presence: true
end
