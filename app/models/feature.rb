class Feature < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  belongs_to :project
  has_many :tasks, dependent: :destroy
  before_save :create_ticket_id

  validates :title, presence: true, length: {minimum: 5, maximum:50}
  validates :description, presence: true
  validates :category_id, presence: true
  
  def create_ticket_id
    self.ticket_id = "FI-"+SecureRandom.hex(5)
  end

  def self.search(search)
    if search
      Feature.where("ticket_id ILIKE ? OR title ILIKE ?", "#{search}%", "#{search}%")
    else
      Feature.all
    end
  end
end
