class HistoryController < ApplicationController
  before_action :set_project

  # GET /history
  def index
    @history = @project.events
      .includes(trackable: [ :user ])
      .where(trackable_type: %w[Comment StatusChange])
      .order(created_at: :asc)
  end

  private
    def set_project
      @project = current_user.projects.find(params[:project_id])
    end
end
