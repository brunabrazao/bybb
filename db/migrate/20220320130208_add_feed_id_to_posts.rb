class AddFeedIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :feed_id, :integer
    add_index :posts, :feed_id
  end
end
