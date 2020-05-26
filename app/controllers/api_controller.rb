class ApiController < ApplicationController
  include ParamsId
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ArgumentError, with: :unprocessable_entity

  private

  def unprocessable_entity(error)
    render_error(error, :unprocessable_entity)
  end

  def record_not_found(error)
    render_error(error, :not_found)
  end

  def render_error(object)
    render json: object.errors, status: :unprocessable_entity
  end

  def current_user
    User.find(request.headers['X-current-user']) if request.headers['X-current-user'].present?
  end
end
