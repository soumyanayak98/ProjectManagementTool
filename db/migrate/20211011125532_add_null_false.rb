class AddNullFalse < ActiveRecord::Migration[6.1]
  def change
    change_column_null :projects, :user_id, false
    change_column_null :features, :project_id, false
    change_column_null :tasks, :feature_id, false
    change_column_null :comments, :task_id, false
    change_column_null :user_tasks, :task_id, false
    change_column_null :user_tasks, :user_id, false

    change_column_null :tasks, :started, false
    change_column_null :tasks, :done, false
    change_column_null :tasks, :delivered, false
  end
end
