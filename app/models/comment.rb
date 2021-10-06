class Comment < ApplicationRecord
  attr_accessor :body
  has_rich_text :body
  belongs_to :task

  validate :comment_body_cant_be_empty
  validates :name, presence: true

  def comment_body_cant_be_empty 
    if self.body.blank?
      self.errors.add(:body, "can't be empty") 
    end   
  end
end