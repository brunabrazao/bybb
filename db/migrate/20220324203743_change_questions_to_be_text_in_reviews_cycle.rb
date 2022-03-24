class ChangeQuestionsToBeTextInReviewsCycle < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews_cycles, :questions, :text
  end
end
