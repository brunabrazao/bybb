class RemoveColumnsFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :question_1, :string
    remove_column :reviews, :answer_1, :string
    remove_column :reviews, :question_2, :string
    remove_column :reviews, :answer_2, :string
    remove_column :reviews, :question_3, :string
    remove_column :reviews, :answer_3, :string
    remove_column :reviews, :question_4, :string
    remove_column :reviews, :answer_4, :string
    remove_column :reviews, :question_5, :string
    remove_column :reviews, :answer_5, :string
    remove_column :reviews, :question_6, :string
    remove_column :reviews, :answer_6, :string
    remove_column :reviews, :question_7, :string
    remove_column :reviews, :answer_7, :string
    remove_column :reviews, :question_8, :string
    remove_column :reviews, :answer_8, :string
    remove_column :reviews, :question_9, :string
    remove_column :reviews, :answer_9, :string
    remove_column :reviews, :question_10, :string
    remove_column :reviews, :answer_10, :string
  end
end
