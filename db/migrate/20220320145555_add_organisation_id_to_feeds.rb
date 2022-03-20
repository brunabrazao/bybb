class AddOrganisationIdToFeeds < ActiveRecord::Migration[7.0]
  def change
    add_column :feeds, :organisation_id, :integer
    add_index :feeds, :organisation_id
  end
end
