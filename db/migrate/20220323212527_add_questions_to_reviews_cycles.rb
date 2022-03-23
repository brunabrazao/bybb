class AddQuestionsToReviewsCycles < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews_cycles, :questions, :string
  end
end
