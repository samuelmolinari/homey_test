module Trackable
  extend ActiveSupport::Concern

  included do
    has_many :events, as: :trackable, dependent: :destroy
    before_create :build_event
  end

  def build_event
    events.build(project:)
  end
end
