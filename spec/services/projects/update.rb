require 'rails_helper'

RSpec.describe Projects::Update do
  let(:project) { create(:project, status: 'draft') }
  let(:user) { create(:user) }

  before do
    project.assign_attributes(name: 'New name')
  end

  subject { described_class.new(user:, project:) }

  describe '#call!' do
    it 'does not create a status change' do
      expect { subject.call! }.to change(StatusChange, :count).by(0)
    end

    it 'saves changes' do
      subject.call!
      expect(project.reload.name).to eq('New name')
    end

    context 'when status changed' do
      before do
        project.assign_attributes(status: 'in_progress')
      end

      it 'creates a status change' do
        expect { subject.call! }.to change(StatusChange, :count).by(1)

        status_change = project.status_changes.last

        expect(status_change.from_status).to eq('draft')
        expect(status_change.to_status).to eq('in_progress')
        expect(status_change.user).to eq(user)
      end
    end
  end
end
