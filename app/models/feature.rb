class Feature < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  belongs_to :project
  has_many :tasks, dependent: :destroy
  before_save :create_ticket_id

  validates :title, presence: true
  validates :description, presence: true
  
  def create_ticket_id
    self.ticket_id = "FI-"+SecureRandom.alphanumeric(20)
  end
end