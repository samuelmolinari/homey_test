require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:username) }

    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:username) }
  end

  context 'encryption' do
    it { should encrypt(:email).deterministic(true) }
  end

  context 'associations' do
    it { should have_many(:project_users).dependent(:destroy) }
    it { should have_many(:projects).through(:project_users) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:status_changes).dependent(:destroy) }
  end
end
