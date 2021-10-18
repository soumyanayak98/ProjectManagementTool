class Comment < ApplicationRecord
  attr_accessor :body
  has_rich_text :body
  belongs_to :task

  validates :name, :body, presence: true
end