class ShorteningsController < ApplicationController
  def create
    @shortening = Shortening.find_or_create_by!(safe_params)
  rescue ActiveRecord::RecordInvalid => e
    render status: 422, json: { errors: e.record.errors.full_messages.uniq }
  end

  private

  def safe_params
    params.permit(:long_url)
  end
end
