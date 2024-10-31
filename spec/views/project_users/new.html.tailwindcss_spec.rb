require 'rails_helper'

RSpec.describe "project_users/new", type: :view do
  let(:project) { create(:project) }
  let(:project_user) { build(:project_user, project:) }

  before(:each) do
    assign(:project, project)
    assign(:project_user, project_user)
    assign(:users, create_list(:user, 2))
  end

  it "renders new project_user form" do
    render

    assert_select "form[action=?][method=?]", project_users_path(project), "post" do
      assert_select "select[name=?]", "project_user[user_id]"
    end
  end
end
