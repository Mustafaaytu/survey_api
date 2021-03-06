class ApplicationController < ActionController::API
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::NameError, with: :error_occurred

  protected

  def record_not_found(exception)
    render json: { error: exception.message }.to_json, status: :not_found

  end

  def error_occurred(exception)
    render json: { error: exception.message }.to_json, status: :internal_server_error
  end
end
