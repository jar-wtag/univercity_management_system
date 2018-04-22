class CreateSemesters < ActiveRecord::Migration
  def up
    create_table :semesters do |t|
      t.string :name, :limit => 50
      t.integer :duration_in_month

      t.timestamps null: false
    end
  end

  def down
    drop_table :semesters
  end
end
