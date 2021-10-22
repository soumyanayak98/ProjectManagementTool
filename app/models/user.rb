class User < ApplicationRecord
  include ActionText::Attachable
  before_save :downcase_fields
  has_secure_password
  has_many :projects, dependent: :destroy
  has_many :user_tasks
  has_many :tasks, through: :user_tasks

  validates :username, presence: true, length: {minimum: 3, maximum: 25}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  validates :email, presence: true, length: { maximum:150}, format: {with: VALID_EMAIL_REGEX}
  validates :password, length: {within: 8..40}
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
      user.password = (('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a + ("\u0020".."\u0040").to_a + ("\u005b".."\u0060").to_a + ("\u007b".."\u007e").to_a).shuffle.first(25).join
      user.color = User.gen_color
    end
  end

  def self.gen_color
    col_array = ["red", "yellow", "green", "blue", "cyan"]
    col_array.sample
  end

  validate :password_lower_case
  validate :password_uppercase
  validate :password_special_char
  validate :password_contains_number

  def password_uppercase
    return if !!password.match(/\p{Upper}/)
    errors.add :password, 'must contain at least 1 uppercase '
  end

  def password_lower_case
    return if !!password.match(/\p{Lower}/)
    errors.add :password, 'must contain at least 1 lowercase '
  end

  def password_special_char
    special = "?<>',?[]}{=-)(*&^%$#`~{}!@"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return if password =~ regex
    errors.add :password, 'must contain special character'
  end

  def password_contains_number
    return if password.count("0-9") > 0
    errors.add :password, 'must contain at least one number'
  end

end

# (('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a + ("\u01f1".."\u01fa").to_a + ("\u0020".."\u00fe").to_a).shuffle.first(25).join
