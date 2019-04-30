class ShorteningsController < ApplicationController
  def create
    @shortening = Shortening.find_or_create_by!(long_url: params.require(:long_url))
  rescue ActiveRecord::RecordInvalid => e
    render status: 422, json: { errors: e.record.errors.full_messages }
  end
end
