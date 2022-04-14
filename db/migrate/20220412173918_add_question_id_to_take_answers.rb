class AddQuestionIdToTakeAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :take_answers, :question_id, :integer
  end
end
