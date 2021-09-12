class User < ApplicationRecord
  before_save :downcase_fields
  has_secure_password
  has_many :projects, dependent: :destroy

  validates :username, presence: true, length: {minimum: 3, maximum: 25}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum:150}, 
                    uniqueness: { case_sensitive: false }, 
                    format: {with: VALID_EMAIL_REGEX}
  validates_confirmation_of :password

  def downcase_fields
    self.email.downcase!
  end
end