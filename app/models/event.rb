class Event < ApplicationRecord
  belongs_to :trackable, polymorphic: true
  belongs_to :project
end
