class Feed < ApplicationRecord
  has_many :posts
  belongs_to :organisation
end
