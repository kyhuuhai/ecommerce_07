class Product < ApplicationRecord
  belongs_to :category

  has_many :cartdetails, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :category_id, presence: true
end
