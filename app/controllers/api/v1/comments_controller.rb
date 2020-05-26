module Api
  module V1
    class CommentsController < ApiController
      # GET /api/v1/tasks/:id/comments
      def index
        render json: comments
      end

      # GET /api/v1/tasks/:id/comments/1
      def show
        render json: comment
      end

      # POST /api/v1/tasks/:id/comments
      def create
        comment = Comment.new(comment_params)
        return render json: comment, status: :created if comments << comment

        render_error(comment)
      end

      # PATCH/PUT /api/v1/tasks/:id/comments/1
      def update
        return render json: comment if comment.update(comment_params)

        render_error(comment)
      end

      # DELETE /api/v1/tasks/:id/comments/1
      delegate :destroy, to: :comment

      private

      def comment
        @comment ||= comments.find(params_id)
      end

      def comments
        @comments ||= current_user.tasks.find(task_id).comments
      end

      def comment_params
        params.require(:comment).permit(:task_id, :comment, :url, :document)
      end
    end
  end
end
