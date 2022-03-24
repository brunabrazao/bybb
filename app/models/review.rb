class Review < ApplicationRecord
  belongs_to :reviews_cycle
  belongs_to :user
end
