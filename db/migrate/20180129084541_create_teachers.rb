class CreateTeachers < ActiveRecord::Migration

  def up
    create_table :teachers do |t|
      t.integer :department_id

      t.string :name, :limit => 50
      t.string :designation, :limit => 70
      t.integer :age

      t.timestamps null: false
    end
    add_index("teachers", "department_id")
  end

  def down
    drop_table :teachers
  end
end
