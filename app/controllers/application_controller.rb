class ApplicationController < ActionController::API
  before_action :set_request_format_json

  def set_request_format_json
    request.format = :json
  end
end
