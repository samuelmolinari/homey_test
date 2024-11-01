require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  let(:project) { create(:project) }

  before(:each) do
    assign(:project, project)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
  end
end
