module Api
  module V1
    class TasksController < ApiController
      # GET /api/v1/project/:id_project/tasks
      def index
        render json: { "id: = #{project.id}, name: #{project.name}":
                      ActiveModelSerializers::SerializableResource.new(tasks) }
      end

      # GET /api/v1/project/:id_project/tasks/1
      def show
        render json: task
      end

      # POST /api/v1/project/:id_project/tasks
      def create
        task = Task.new(task_params)

        return render json: task, status: :created if project.tasks << task

        render json: task.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /api/v1/project/:id_project/tasks/1
      def update
        return render json: task  if task.update(task_params)

        render json: task.errors, status: :unprocessable_entity
      end

      # DELETE /api/v1/project/:id_project/tasks/1
      delegate :destroy, to: :task

      private

      def task
        @task ||= project.tasks.find(params.require(:id))
      end

      def project
        @project ||= current_user.projects.find(params.require(:project_id))
      end

      def task_params
        params.require(:task).permit(:deadline, :description, :state, :priority)
      end

      def tasks
        project.tasks.order(:state).order(deadline: :asc)
      end
    end
  end
end
