class AddNumberoforderToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :number_of_order, :integer , default: 0
  end
end
