require 'rails_helper'

RSpec.describe "project_users/index", type: :view do
  let(:project) { create(:project) }
  let(:project_users) { create_list(:project_user, 2, project:) }

  before(:each) do
    assign(:project, project)
    assign(:project_users, project_users)
  end

  it "renders a list of project_users" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(project_users.map(&:user_username).join('|')), count: 2
  end
end
