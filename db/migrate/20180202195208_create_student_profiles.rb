class CreateStudentProfiles < ActiveRecord::Migration
  def up
    create_table :student_profiles do |t|
      t.integer :section_id
      t.integer :student_id

      t.integer :year
      t.integer :result
      t.timestamps
    end
    add_index("student_profiles", ['section_id', 'student_id'])
  end

  def down
    drop_table :student_profiles
  end
end
