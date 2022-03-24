class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :question_1
      t.string :answer_1
      t.string :question_2
      t.string :answer_2
      t.string :question_3
      t.string :answer_3
      t.string :question_4
      t.string :answer_4
      t.string :question_5
      t.string :answer_5
      t.string :question_6
      t.string :answer_6
      t.string :question_7
      t.string :answer_7
      t.string :question_8
      t.string :answer_8
      t.string :question_9
      t.string :answer_9
      t.string :question_10
      t.string :answer_10
      t.integer :reviews_cycle_id

      t.timestamps
    end
    add_index :reviews, :reviews_cycle_id
  end
end
