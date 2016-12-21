class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.boolean :status, default: true
      t.float :totalprice

      t.timestamps
    end
  end
end
