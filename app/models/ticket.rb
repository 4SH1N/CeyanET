class Ticket < ApplicationRecord
  belongs_to :client
  belongs_to :device, optional: true

  has_many :activities, dependent: :destroy

  enum :priority, { low: 0, medium: 1, high: 2, critical: 3 }, default: :low
  enum :status,   { open: 0, in_progress: 1, waiting: 2, closed: 3 }, default: :open
end
