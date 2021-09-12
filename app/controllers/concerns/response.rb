# app/controllers/concerns/response.rb
module Response
  def unauthorized(message = "Unauthorized")
    render json: { message: message }, status: :unauthorized
  end

  def not_found(message = "Not Found")
    render json: { message: message }, status: :not_found
  end

  def bad_request(message = "Bad request")
    render json: { message: message }, status: :bad_request
  end

  def unprocessable_entity(message = "Unprocessable Entity")
    render json: { message: message }, status: :unprocessable_entity
  end

  def validated_failed(object, message = "Validation failed")
    render json: { message: message, errors: object }, status: :unprocessable_entity
  end

  def internal_server_error(message = "Internal server error")
    render json: { message: message }, status: :internal_server_error
  end

  def api_created(object, message = "Created successfully")
    render json: { message: message, data: object }, status: :created
  end

  def api_updated(object, message = "Updated successfully")
    render json: { message: message, data: object }, status: :accepted
  end

  def api_deleted(message = "No content")
    render json: { message: message }, status: :no_content
  end

  def api_item(object, message = "Data retrieval successfully")
    render json: { message: message, data: object }, status: :ok
  end

  def api_collection(object, message = "Data retrieval successfully")
    render json: { message: message, data: object }, status: :ok
  end

  def api_success(object, message = "Success")
    render json: { message: message, data: object }, status: :ok
  end

  def api_pagination(object, message = "Data retrieval successfully")
    render json: { message: message, total: object.pages.total, page: object.pages.page, perPage: object.pages.perPage, lastPage: object.pages.lastPage, data: object.rows }, status: :ok
  end
end
