class Report < ApplicationRecord
  belongs_to :user


  def submitted_this_week?
    created_at.to_date.cweek == Date.current.cweek
  end
end
