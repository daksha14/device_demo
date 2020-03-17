class ProjectsController < InheritedResources::Base
  before_action :authenticate_user!


  def index
    @projects = current_user.projects
  end

  private

    def project_params
      params.require(:project).permit(:title, :description)
    end

end
