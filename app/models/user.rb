class User < ApplicationRecord
  has_secure_password
  has_many :projects

  validates :username, presence: true, length: {minimum: 3, maximum: 25}
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end
end