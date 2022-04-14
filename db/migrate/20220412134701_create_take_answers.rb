class CreateTakeAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :take_answers do |t|
      t.text :user_answer
      t.references :take_test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
