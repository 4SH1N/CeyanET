class Device < ApplicationRecord
  belongs_to :client

  has_many :tickets, dependent: :nullify

  enum :status, { active: 0, maintenance: 1, out_of_service: 2, retired: 3 }, default: :active
end
