class ProjectUsersController < ApplicationController
  before_action :set_project
  before_action :set_project_user, only: %i[ destroy ]
  before_action :set_users, only: %i[ new create ]

  # GET /project_users or /project_users.json
  def index
    @project_users = @project.project_users
  end

  # GET /project_users/new
  def new
    @project_user = @project.project_users.build
  end

  # POST /project_users or /project_users.json
  def create
    @project_user = @project.project_users.new(project_user_params)

    respond_to do |format|
      if @project_user.save
        format.html { redirect_to @project, notice: "Project user was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_users/1 or /project_users/1.json
  def destroy
    @project_user.destroy!

    respond_to do |format|
      format.html { redirect_to @project, status: :see_other, notice: "Project user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_users
      @users = User.where.not(id: @project.users)
    end

    def set_project
      @project = current_user.projects.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project_user
      @project_user = @project.project_users.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_user_params
      params.require(:project_user).permit(:user_id)
    end
end
