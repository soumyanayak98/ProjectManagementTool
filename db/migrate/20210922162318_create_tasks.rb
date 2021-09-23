class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :tasks do |t|
      t.references :feature, foreign_key: true, type: :uuid
      t.text :description
      t.boolean :done, default: false
      t.timestamps
    end
  end
end
