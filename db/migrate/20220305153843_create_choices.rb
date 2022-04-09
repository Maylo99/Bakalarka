class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.integer :partialPoints
      t.string :answer
      t.boolean :is_true
      t.references :multiple_choice_question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
