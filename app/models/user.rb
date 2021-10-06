class User < ApplicationRecord
  include ActionText::Attachable
  before_save :downcase_fields
  has_secure_password
  has_many :projects, dependent: :destroy
  has_many :user_tasks
  has_many :tasks, through: :user_tasks

  validates :username, presence: true, length: {minimum: 3, maximum: 25}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  PASSWORD_FORMAT = /\A
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x
  validates :email, presence: true, length: { maximum:150}, 
                    format: {with: VALID_EMAIL_REGEX}
  validates :password, :length => {:within => 8..40}, format: {with: PASSWORD_FORMAT}
  validates_confirmation_of :password

  def downcase_fields
    self.email.downcase!
  end

  def to_trix_content_attachment_partial_path
    to_partial_path
  end

  def self.from_omniauth(auth)
    where(uid: auth.uid, provider: auth.provider).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = (('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a + ("\u0020".."\u00fe").to_a).shuffle.first(25).join
      user.color = User.gen_color
    end
  end

  def self.gen_color
    col_array = ["red", "yellow", "green", "blue", "cyan"]
    col_array.sample
  end

end

# (('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a + ("\u01f1".."\u01fa").to_a + ("\u0020".."\u00fe").to_a).shuffle.first(25).join
