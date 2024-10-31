require "rails_helper"

RSpec.describe ProjectUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/projects/10/project_users").to route_to("project_users#index", project_id: "10")
    end

    it "routes to #new" do
      expect(get: "/projects/10/project_users/new").to route_to("project_users#new", project_id: "10")
    end

    it "routes to #create" do
      expect(post: "/projects/10/project_users").to route_to("project_users#create", project_id: "10")
    end

    it "routes to #destroy" do
      expect(delete: "/projects/10/project_users/1").to route_to("project_users#destroy", project_id: "10", id: "1")
    end
  end
end
