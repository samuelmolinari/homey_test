class StatusChange < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :from_status, presence: true, allow_nil: true, inclusion: { in: Project::STATUS }
  validates :to_status, presence: true, inclusion: { in: Project::STATUS }
  validate :from_status_cannot_be_same_as_to_status

  private

  def from_status_cannot_be_same_as_to_status
    if from_status == to_status
      errors.add(:from_status, "can't be the same as to_status")
    end
  end
end
