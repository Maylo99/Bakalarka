class CreateTakeTests < ActiveRecord::Migration[7.0]
  def change
    create_table :take_tests do |t|
      t.integer :gets_points
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
