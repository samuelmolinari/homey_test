require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:comment) { build(:comment, project: project, user: user, body: '') }

  before(:each) do
    assign(:project, project)
    assign(:comment, comment)
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", project_comments_path(project), "post" do
      assert_select "textarea[name=?]", "comment[body]"
    end
  end
end
