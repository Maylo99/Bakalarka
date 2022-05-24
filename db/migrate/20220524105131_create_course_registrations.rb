class CreateCourseRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :course_registrations do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
