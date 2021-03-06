describe 'Create shortening,', type: :request do
  def do_request(url = nil)
    post(
      '/short_link',
      params: { long_url: url || 'https://google.com' }.to_json,
      headers: { 'CONTENT_TYPE': 'application/json' }
    )

    @parsed = JSON.parse(@response.body).with_indifferent_access
  end

  def do_request_with_blank_params(url = nil)
    post(
      '/short_link',
      params: {}.to_json,
      headers: { 'CONTENT_TYPE': 'application/json' }
    )

    @parsed = JSON.parse(@response.body).with_indifferent_access
  end

  describe 'when provided a valid long url,' do
    describe 'when the url has not been submitted before,' do
      before(:example) { do_request }

      it 'returns the long url' do
        expect(@parsed).to have_key(:long_url)
      end

      it 'returns the short_link' do
        expect(@parsed).to have_key(:short_link)
      end
    end

    describe 'when the url has been submitted before,' do
      before(:example) do
        url = 'https://www.mozilla.org/en-US/firefox/new/'
        @existing = create(:shortening, long_url: url)
        do_request(url)
      end

      it 'returns the existing url and short link' do
        expect(@parsed[:short_link]).to match(@existing.short_link_code)
      end
    end
  end

  describe 'when provided an invalid long url' do
    before(:example) { do_request('invalid-url') }

    it('returns a 422') { expect(@response.status).to eq(422) }
    it 'includes a message about the invaliad format' do
      expect(@parsed[:errors]).to include('Long url must be a valid url')
    end
  end

  describe 'when provided with no long url' do
    before(:example) { do_request_with_blank_params }

    it('returns 422'){ expect(@response.status).to eq(422) }
    it 'includes a message about the missing parameter' do
      expect(@parsed[:errors]).to include('Long url can\'t be blank')
    end
  end
end
