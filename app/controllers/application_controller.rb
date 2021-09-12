class ApplicationController < ActionController::API
  include Response
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found()
    not_found
  end
end
