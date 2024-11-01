require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  let(:projects) { create_list(:project, 2) }
  before(:each) do
    assign(:projects, projects)
  end

  it "renders a list of projects" do
    render
    expect(rendered).to match(projects.first.name)
    expect(rendered).to match(projects.first.status)
    expect(rendered).to match(projects.last.name)
    expect(rendered).to match(projects.last.status)
  end
end
