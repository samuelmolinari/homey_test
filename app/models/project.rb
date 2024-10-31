class Project < ApplicationRecord
  STATUS = [
    DRAFT = "draft",
    ACTIVE = "active",
    COMPLETED = "completed",
    ABANDONED = "abandoned"
  ].freeze

  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
end
