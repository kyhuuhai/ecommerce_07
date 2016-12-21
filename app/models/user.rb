class User < ApplicationRecord
  has_many :suggestions, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  before_save {self.email = email.downcase}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  presence: true, length: {maximum: Settings.name_maximum}
  validates :email, presence: true, length: {maximum: Settings.email_maximum},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness:{case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.password_minimum}, allow_nil: true

  has_secure_password
end
