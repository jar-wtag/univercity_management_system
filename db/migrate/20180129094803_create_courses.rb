class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.integer :department_id

      t.string :name, :limit => 60
      t.integer :course_code

      t.timestamps null: false
    end

    add_index("courses", "department_id")
  end

  def down
    drop_table :courses
  end
end
