require 'rails_helper'

RSpec.describe 'Link translator' do
  describe 'GET #show' do
    let(:shortened_url) { create(:shortened_url, views_count: 0) }
    let(:endpoint_url)  { "/s/#{shortened_url.unique_key}" }

    it 'increases views count' do
      get endpoint_url

      expect(shortened_url.reload.views_count).to eql(1)
    end

    context 'when link expired' do
      let(:shortened_url) { create(:shortened_url, expires_at: Date.yesterday) }

      it 'redirects to 404 page' do
        expect{ get endpoint_url }.to raise_error(ActionController::RoutingError)
      end
    end
  end
end