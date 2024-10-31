class ProjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :project

  delegate :email, :username, to: :user, prefix: true
end
