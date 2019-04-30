describe 'Visit short link', type: :request do
  describe 'when the requested link exists' do
    it 'redirects to the long_url' do
      url = 'https://www.nasa.gov'
      shortening = create(:shortening, long_url: url)

      get "/#{shortening.short_link_code}"

      expect(@response).to redirect_to(url)
    end
  end

  describe 'when the requested link does not exist' do
    it 'renders an error message'
  end
end
