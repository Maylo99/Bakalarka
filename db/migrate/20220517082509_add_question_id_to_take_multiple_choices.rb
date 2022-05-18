class AddQuestionIdToTakeMultipleChoices < ActiveRecord::Migration[7.0]
  def change
    add_column :take_multiple_choices, :question_id, :integer
  end
end
