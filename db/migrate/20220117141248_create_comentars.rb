class CreateComentars < ActiveRecord::Migration[7.0]
  def change
    create_table :comentars do |t|
      t.references :video, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :text
      t.datetime :date

      t.timestamps
    end
  end
end
