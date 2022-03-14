class ChangeManagerToBeIntegerInUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :manager, :string
  end

  def down
    change_column :users, :manager, :integer
  end
end
