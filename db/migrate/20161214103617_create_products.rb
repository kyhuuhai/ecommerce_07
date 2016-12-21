class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.float :price
      t.string :description
      t.string :image
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
