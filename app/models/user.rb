class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password

  has_many :articles, dependent: :destroy

  validates :username, presence: true, 
                      uniqueness: true, 
                      length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address" }

  def own?(object)
    self.id == object.user_id
  end
end
