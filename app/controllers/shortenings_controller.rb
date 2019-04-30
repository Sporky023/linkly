class ShorteningsController < ApplicationController
  def create
    @shortening = Shortening.find_or_create_by!(long_url: params.require(:long_url))
  end
end
