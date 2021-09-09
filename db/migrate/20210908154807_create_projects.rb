class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :project_name, null: false
      t.timestamps
    end
  end
end
