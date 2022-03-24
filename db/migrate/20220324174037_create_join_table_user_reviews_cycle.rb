class CreateJoinTableUserReviewsCycle < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :reviews_cycles do |t|
      t.index %i[user_id reviews_cycle_id]
      t.index %i[reviews_cycle_id user_id]
    end
  end
end
