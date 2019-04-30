class ShorteningPresenter < BasePresenter
  def short_link
    URI.join(@view_context.request.base_url, short_link_code)
  end
end
