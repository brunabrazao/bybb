class Review < ApplicationRecord
  belongs_to :reviews_cycle
  belongs_to :user
  serialize :answers, Hash
  store_accessor :answers, :answer_one, :answer_two, :answer_three, :answer_four, :answer_five,
                 :answer_six, :answer_seven, :answer_eight, :answer_nine, :answer_ten
end
