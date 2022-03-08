class RenameManagerToManagerId < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :manager, :manager_id
  end
end
