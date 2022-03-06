class AddLicensesToOrganisations < ActiveRecord::Migration[7.0]
  def change
    add_column :organisations, :licenses, :integer
  end
end
