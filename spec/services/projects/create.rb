require 'rails_helper'

RSpec.describe Projects::Create do
  let(:project) { build(:project) }
  let(:user) { create(:user) }

  subject { described_class.new(user:, project:) }

  describe '#call!' do
    it 'creates a project' do
      expect { subject.call! }.to change(Project, :count).by(1)
    end

    it 'creates a project user' do
      expect { subject.call! }.to change(ProjectUser, :count).by(1)
      expect(project.users).to include(user)
    end

    it 'creates a status change' do
      expect { subject.call! }.to change(StatusChange, :count).by(1)

      status_change = project.status_changes.last

      expect(status_change.from_status).to be_nil
      expect(status_change.to_status).to eq(project.status)
      expect(status_change.user).to eq(user)
    end
  end
end
