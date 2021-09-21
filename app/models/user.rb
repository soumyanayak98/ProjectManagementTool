class User < ApplicationRecord
  before_save :downcase_fields
  has_secure_password
  has_many :projects, dependent: :destroy

  validates :username, presence: true, length: {minimum: 3, maximum: 25}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum:150}, 
                    format: {with: VALID_EMAIL_REGEX}
  validates_confirmation_of :password

  def downcase_fields
    self.email.downcase!
  end

  def self.from_omniauth(auth)
    where(uid: auth.uid, provider: auth.provider).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex(15)
    end
  end
end