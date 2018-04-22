class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.integer :department_id

      t.string :name, :limit => 50
      t.integer :age
      t.integer :roll

      t.timestamps null: false
    end
    add_index("students", "department_id")
  end
  def down
    drop_table :students
  end
end
