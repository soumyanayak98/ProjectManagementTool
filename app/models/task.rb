class Task < ApplicationRecord
  belongs_to :feature
  has_many :user_tasks
  has_many :users, through: :user_tasks
  has_many :comments, dependent: :destroy

  validates :description, presence: true

  STARTED = "Started"
  NOT_STARTED = "Not Started"
  FINISHED = "Finished"
  DELIVERED = "Delivered"

  def status
    if delivered
      DELIVERED
    else
      if done
        FINISHED
      else
        started ? STARTED : NOT_STARTED
      end
    end
  end
end