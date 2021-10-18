class Comment < ApplicationRecord
  belongs_to :task

  validates :name, :body, presence: true
end