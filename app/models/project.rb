class Project < ApplicationRecord
  STATUS = [
    DRAFT = "draft",
    ACTIVE = "active",
    COMPLETED = "completed",
    ABANDONED = "abandoned"
  ].freeze

  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }

  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
end
