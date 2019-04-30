class ShorteningsController < ApplicationController
  def create
    @shortening = Shortening.create!(long_url: params.require(:long_url))
  end
end
