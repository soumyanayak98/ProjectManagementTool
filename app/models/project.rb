class Project < ApplicationRecord
  belongs_to :user
  validates :project_name, presence: true, length: {minimum: 5, maximum:100}
end