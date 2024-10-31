require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'associations' do
    it { should belong_to(:project) }
    it { should belong_to(:trackable) }
  end
end
