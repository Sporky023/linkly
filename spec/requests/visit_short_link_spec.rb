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
    before(:example){ get "/#{SecureRandom.hex(4)}" }

    it('returns a 404'){ expect(@response.status).to eq(404) }

    it('includes a message about the missing link') do
      expect(JSON.parse(@response.body)['errors']).to(
        include('Could not find that short link')
      )
    end
  end
end
