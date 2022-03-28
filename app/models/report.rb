class Report < ApplicationRecord
  belongs_to :user
  validates :biggest_challenge, presence: true
  validates :weekly_priority, presence: true

  def submitted_this_week?
    created_at.to_date.cweek == Date.current.cweek
  end
end
