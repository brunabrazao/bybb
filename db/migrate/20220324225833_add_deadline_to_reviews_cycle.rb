class AddDeadlineToReviewsCycle < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews_cycles, :deadline, :date
  end
end
