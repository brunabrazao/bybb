class ChangeManagerIdToBeIntegerInUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :manager_id, :integer
  end

  def down
    change_column :users, :manager_id, :string
  end
end
