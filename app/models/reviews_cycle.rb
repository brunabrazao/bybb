class ReviewsCycle < ApplicationRecord
  belongs_to :organisation
  serialize :questions, Array

  def questions=(questions)
    questions = questions.split(',') if questions.is_a?(String)
    super(questions)
  end
end
