class AddExtraFieldsToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :credit, :integer
  end
end
