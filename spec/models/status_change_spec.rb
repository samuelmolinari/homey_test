require 'rails_helper'

RSpec.describe StatusChange, type: :model do
  subject { build(:status_change) }

  context 'validations' do
    it { should validate_presence_of(:from_status).allow_nil }
    it { should validate_presence_of(:to_status) }
    it { should validate_inclusion_of(:from_status).in_array(Project::STATUS).allow_nil }
    it { should validate_inclusion_of(:to_status).in_array(Project::STATUS) }

    it 'validates that from_status is not the same as to_status' do
      status_change = build(:status_change, from_status: 'draft', to_status: 'draft')
      status_change.valid?
      expect(status_change.errors[:from_status]).to include("can't be the same as to_status")
    end
  end

  context 'associations' do
    it { should belong_to(:project) }
    it { should belong_to(:user) }
  end
end
