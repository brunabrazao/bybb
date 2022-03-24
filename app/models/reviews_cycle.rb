class ReviewsCycle < ApplicationRecord
  belongs_to :organisation
  has_many :reviews
  has_and_belongs_to_many :users
  serialize :questions, Array
  serialize :selected_users, Array

  def questions=(questions)
    questions = questions.split(',') if questions.is_a?(String)
    super(questions)
  end
end
