class Comment < ApplicationRecord
  include Trackable

  belongs_to :user
  belongs_to :project

  validates :body, presence: true

  delegate :email, :username, to: :user, prefix: true
end
