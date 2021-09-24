class AddToFeature < ActiveRecord::Migration[6.1]
  def change
    add_column :features, :attachment, :string
  end
end
