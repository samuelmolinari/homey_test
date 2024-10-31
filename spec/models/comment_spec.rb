require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it { should validate_presence_of(:body) }
  end

  context 'associations' do
    it { should belong_to(:project) }
    it { should belong_to(:user) }
    it { should have_many(:events).dependent(:destroy) }
  end

  context 'on create' do
    subject { build(:comment) }

    it 'creates an event' do
      expect { subject.save! }.to change(Event, :count).by(1)

      event = Event.last

      expect(event.project).to eq(subject.project)
      expect(event.trackable).to eq(subject)
    end
  end
end
