class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, 
                      uniqueness: true, 
                      length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address" }
end
