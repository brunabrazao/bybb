class CreateReviewsCycles < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews_cycles do |t|
      t.string :name
      t.integer :organisation_id

      t.timestamps
    end
    add_index :reviews_cycles, :organisation_id
  end
end
