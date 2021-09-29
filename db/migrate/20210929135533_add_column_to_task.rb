class AddColumnToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :started, :boolean, default: false
    add_column :tasks, :delivered, :boolean, default: false
  end
end
