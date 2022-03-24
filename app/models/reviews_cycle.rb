class ReviewsCycle < ApplicationRecord
  belongs_to :organisation
  has_many :reviews
  has_and_belongs_to_many :users
  serialize :questions, Hash
  serialize :selected_users, Array
  store_accessor :questions, :question_one, :question_two, :question_three, :question_four, :question_five,
                 :question_six, :question_seven, :question_eight, :question_nine, :question_ten
end
