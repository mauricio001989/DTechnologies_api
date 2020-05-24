module Api
  module V1
    class UsersController < ApiController
      # GET /api/v1/users
      def index
        render json: { 'Users': ActiveModelSerializers::SerializableResource.new(User.all) }
      end

      # GET /api/v1/users/:id
      def show
        render json: user
      end

      # POST /api/v1/users/:User
      def create
        user = User.new(user_params)
        return render json: user, status: :created if user.save

        render json: user.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /api/v1/users/:id
      def update
        return render json: user if user.update(user_params)

        render json: user.errors, status: :unprocessable_entity
      end

      # DELETE /api/v1/users/:id
      delegate :destroy, to: :user

      private

      def user
        @user ||= User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :email, :document)
      end
    end
  end
end
