class Cart < ApplicationRecord
  belongs_to :user

  has_many :cartdetails, dependent: :destroy

  validates :user_id, presence: true

  before_save :update_subtotal

  def subtotal
    cartdetails.collect { |i| i.valid? ? i.total_price : 0}.sum
  end

  private
  def update_subtotal
    self[:totalprice] = subtotal
  end
end
