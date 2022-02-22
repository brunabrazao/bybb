class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.text :weekly_priority
      t.text :biggest_challenge
      t.text :additional

      t.timestamps
    end
  end
end
