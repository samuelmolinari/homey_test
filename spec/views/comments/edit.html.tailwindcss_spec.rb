require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:comment) { create(:comment, project: project, user: user) }

  before(:each) do
    assign(:project, project)
    assign(:comment, comment)
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", project_comment_path(project, comment), "post" do
      assert_select "textarea[name=?]", "comment[body]"
    end
  end
end
