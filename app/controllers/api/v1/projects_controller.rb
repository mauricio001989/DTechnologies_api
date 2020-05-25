module Api
  module V1
    class ProjectsController < ApiController
      # GET /api/v1/projects
      def index
        # TODO: expecteding policy for projects filter
        render json: { 'Projects': ActiveModelSerializers::SerializableResource.new(Project.all) }
      end

      # GET /api/v1/projects/1
      def show
        render json: project
      end

      # POST /api/v1/projects
      def create
        project = Project.new(project_params)

        return render json: project, status: :created if project.save

        render json: project.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /api/v1/projects/1
      def update
        return render json: project if project.update(project_params)

        render json: project.errors, status: :unprocessable_entity
      end

      # DELETE /api/v1/projects/1
      delegate :destroy, to: :project

      private

      def project
        @project ||= Project.find(params[:id])
      end

      def project_params
        params.require(:project).permit(:name, :user_id)
      end
    end
  end
end
