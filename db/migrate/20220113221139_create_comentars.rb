class CreateComentars < ActiveRecord::Migration[7.0]
  def change
    create_table :comentars do |t|
      t.text :text
      t.belongs_to :video

      t.timestamps
    end
  end
end
