class Cart < ApplicationRecord
  belongs_to :user

  has_many :cartdetails, dependent: :destroy
  
  validates :user_id, presence: true
end
