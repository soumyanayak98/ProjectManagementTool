class Project < ApplicationRecord
  belongs_to :user
  has_many :features, dependent: :destroy
  before_save :capitalize_name
  validates :project_name, presence: true, length: {minimum: 5, maximum:100}, uniqueness: { scope: :user_id, case_sensitive: false}

  def capitalize_name
    self.project_name.capitalize!
  end
end