class CreateTakeMultipleChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :take_multiple_choices do |t|
      t.text :choice
      t.boolean :is_correct
      t.references :take_test, null: false, foreign_key: true
      t.integer :choice_id

      t.timestamps
    end
  end
end
