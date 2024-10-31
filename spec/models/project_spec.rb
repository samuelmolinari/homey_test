require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(Project::STATUS) }
  end
end
