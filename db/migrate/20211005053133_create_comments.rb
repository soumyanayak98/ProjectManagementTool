class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :task, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
