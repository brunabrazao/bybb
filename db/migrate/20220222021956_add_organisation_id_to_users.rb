class AddOrganisationIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :organisation_id, :integer
    add_index :users, :organisation_id
  end
end
