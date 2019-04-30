class ShorteningsController < ApplicationController
  def create
    @shortening = Shortening.find_or_create_by!(safe_params)
  rescue ActiveRecord::RecordInvalid => e
    render status: 422, json: { errors: e.record.errors.full_messages.uniq }
  end

  def get_redirect
    @shortening = Shortening.find_by!(
      short_link_code: params.require(:short_link_code)
    )

    redirect_to @shortening.long_url
  rescue ActiveRecord::RecordNotFound => e
    render status: 404, json: { errors: ["Could not find that short link"] }
  end

  private

  def safe_params
    params.permit(:long_url)
  end
end
