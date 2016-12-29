class Product < ApplicationRecord
  belongs_to :category

  has_many :cartdetails, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :category_id, presence: true

  scope :top_new_product, ->{order created_at: :desc}
  scope :is_ordered, ->{where "number_of_order > 0"}
  scope :order_number, ->{order number_of_order: :desc}
end
