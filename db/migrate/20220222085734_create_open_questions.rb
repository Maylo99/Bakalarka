class CreateOpenQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :open_questions do |t|
      t.text :question
      t.string :correctAnswer
      t.integer :points
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
