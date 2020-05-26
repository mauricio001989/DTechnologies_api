module Api
  module V1
    class ProjectsController < ApiController
      # GET /api/v1/projects
      def index
        render json: { 'Projects':
         ActiveModelSerializers::SerializableResource.new(current_user.projects) }
      end

      # GET /api/v1/projects/1
      def show
        render json: project
      end

      # POST /api/v1/projects
      def create
        project = Project.new(project_params)

        return render json: project, status: :created if current_user.projects << project

        render_error(project)
      end

      # PATCH/PUT /api/v1/projects/1
      def update
        return render json: project if project.update(project_params)

        render_error(project)
      end

      # DELETE /api/v1/projects/1
      delegate :destroy, to: :project

      private

      def project
        @project ||= current_user.projects.find(params_id)
      end

      def project_params
        params.require(:project).permit(:name, :user_id)
      end
    end
  end
end
