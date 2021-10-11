class Task < ApplicationRecord
  belongs_to :feature
  has_many :user_tasks
  has_many :users, through: :user_tasks
  has_many :comments, dependent: :destroy

  validates :description, presence: true
end