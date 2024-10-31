class Projects::Update < ApplicationService
  attr_reader :project, :user

  def initialize(project:, user:)
    @project = project
    @user = user
  end

  def call!
    build_status_change if project_status_changed?
    project.save!
  end

  private

  def build_status_change
    project.status_changes.build(
      user:,
      from_status: project.status_was,
      to_status: project.status
    )
  end

  def project_status_changed?
    project.status_changed?
  end
end
