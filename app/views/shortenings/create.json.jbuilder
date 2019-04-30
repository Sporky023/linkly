presenter = ShorteningPresenter.new(@shortening, self)

json.(presenter, :long_url, :short_link)
