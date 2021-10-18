class Comment < ApplicationRecord
  default_scope { order('created_at DESC') }
  belongs_to :task

  validates :name, :body, presence: true
end