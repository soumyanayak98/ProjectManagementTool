class AddUniqueIndexToProjectName < ActiveRecord::Migration[6.1]
  def change
    add_index :projects, [:project_name, :user_id], unique: true
  end
end
