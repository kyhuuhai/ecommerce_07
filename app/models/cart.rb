class Cart < ApplicationRecord
  belongs_to :user

  has_many :cartdetails, dependent: :destroy

  validates :user_id, presence: true

  scope:created_order,->{order "created_at asc"}
end
