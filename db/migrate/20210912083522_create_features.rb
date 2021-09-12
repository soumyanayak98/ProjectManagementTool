class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :features, id: :uuid do |t|
      t.references :project, foreign_key: true
      t.string :ticket_id, null: false, index: {unique: true}
      t.integer :category_id, null: false
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
