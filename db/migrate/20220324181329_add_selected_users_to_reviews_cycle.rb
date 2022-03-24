class AddSelectedUsersToReviewsCycle < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews_cycles, :selected_users, :string
  end
end
