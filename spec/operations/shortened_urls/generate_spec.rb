require 'rails_helper'

RSpec.describe ShortenedUrls::Generate do
  let(:params)    { Hash[original_url: 'www.google.com'] }

  describe '#call' do
    let(:expected_output) { params.merge({unique_key: 'q5cyy'}) }

    it 'returns hash with shorted url' do
      result = subject.call(params).success

      expect(result[:original_url]).to eql('www.google.com')
      expect(result[:unique_key].length).to eql(5)
    end

    context 'when unique key exists' do
      before do
        create(:shortened_url) { create(:shortened_url, unique_key: '55555') }
      end

      it 'generates key again' do
        allow(subject).to receive(:generate_random_string).and_return('55555', '11111')

        result = subject.call(params).success

        expect(result[:original_url]).to eql('www.google.com')
        expect(result[:unique_key]).to eql('11111')
      end
    end
  end
end