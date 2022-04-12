class ReviewsCycle < ApplicationRecord
  belongs_to :organisation
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :users

  serialize :questions, Hash
  serialize :selected_users, Array
  store_accessor :questions, :question_one, :question_two, :question_three, :question_four, :question_five,
                 :question_six, :question_seven, :question_eight, :question_nine, :question_ten

  validates :question_one, presence: true
  validates :question_two, presence: true
  validates :question_three, presence: true
  validates :review_request_date, presence: true
  validates :deadline, presence: true
  validates :name, presence: true

  scope :review_request_date_ready, lambda {
                                      where.not(review_request_date: nil).where('review_request_date <= ?', Date.current)
                                    }
  scope :deadline_ready, -> { where.not(deadline: nil).where('deadline >= ?', Date.current) }
  scope :ready, -> { review_request_date_ready && deadline_ready }

  def locked?
    review_request_date.present? && review_request_date <= Date.current
  end

  def unlocked?
    !locked?
  end

  def enabled?
    locked? && deadline.present? && deadline >= Date.current
  end
end
