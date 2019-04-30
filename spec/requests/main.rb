describe 'Create shortening,', type: :request do
  describe 'when provided a valid long url,' do
    describe 'when the url has not been submitted before,' do
      before(:example) do
        post(
          '/short_link',
          params: { long_url: 'https://google.com' }.to_json,
          headers: { 'CONTENT_TYPE': 'application/json' }
        )

        @parsed = JSON.parse(@response.body).with_indifferent_access
      end

      it 'returns the long url' do
        expect(@parsed).to have_key(:long_url)
      end

      it 'returns the short_link' do
        expect(@parsed).to have_key(:short_link)
      end
    end

    describe 'when the url has been submitted before,' do
      before(:example) do

      end

      it 'returns the existing url and short link'
    end
  end

  describe 'when provided an invalid long url' do
    it 'returns a 422'
    it 'includes a message about the invaliad format'
  end

  describe 'when provided with no long url' do
    it 'returns 422'
    it 'includes a message about the missing parameter'
  end
end
