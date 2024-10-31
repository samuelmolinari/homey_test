require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it { should validate_presence_of(:body) }
  end

  context 'associations' do
    it { should belong_to(:project) }
    it { should belong_to(:user) }
  end
end
