class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.integer :course_id
      t.integer :teacher_id
      t.integer :semester_id

      t.integer :section_no
      t.timestamps null: false
    end
    add_index("sections", ['course_id', 'teacher_id', 'semester_id'])
  end

  def down
    drop_table :sections
  end
end
