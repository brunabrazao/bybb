class RemoveFeedIdFromOrganisations < ActiveRecord::Migration[7.0]
  def change
    remove_column :organisations, :feed_id, :integer
  end
end
