class AddNotificationSentToReviewsCycle < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews_cycles, :notification_sent, :boolean
  end
end
