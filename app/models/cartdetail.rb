class Cartdetail < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :cart_id, presence: true
  validates :product_id, presence: true
  validates :quantity, numericality: {only_integer: true}

  def total_price
    product.price * quantity
  end
end
