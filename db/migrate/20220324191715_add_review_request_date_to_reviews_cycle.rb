class AddReviewRequestDateToReviewsCycle < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews_cycles, :review_request_date, :date
  end
end
