class CreateDepartments < ActiveRecord::Migration
  def up
    create_table :departments do |t|
      t.string :name, :limit => 50

      t.timestamps null: false
    end
  end

  def down
    drop_table :departments
  end
end
