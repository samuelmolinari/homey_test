class Projects::Create < ApplicationService
  attr_reader :project, :user

  def initialize(project:, user:)
    @project = project
    @user = user
  end

  def call!
    build_status_change
    build_project_user
    project.save!
  end

  private

  def build_status_change
    project.status_changes.build(
      user:,
      from_status: nil,
      to_status: project.status
    )
  end

  def build_project_user
    project.project_users.build(user: user)
  end
end
