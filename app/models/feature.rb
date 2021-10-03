class Feature < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  belongs_to :project
  has_many :tasks, dependent: :destroy
  before_save :create_ticket_id

  validates :title, presence: true
  validates :description, presence: true
  
  def create_ticket_id
    self.ticket_id = "FI-"+SecureRandom.hex(5)
  end

  def self.search(search)
    if search
      if search[0..2] == "FI-" || search[0..2] == "fi-"
        Feature.where("ticket_id ILIKE ?", "#{search}%")
      else
        Feature.where("title ILIKE ?", "#{search}%")
      end
    else
      Feature.all
    end
  end
end