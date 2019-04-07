require 'rails_helper'

RSpec.describe ShortenedUrls::Sanitize do
  describe '#call' do
    expected_output = Hash[original_url: 'www.google.com']

    context 'when white spaces' do
      let(:params) { Hash[original_url: "   www.google.com  \n"] }

      it 'removes white spaces' do
        expect(described_class.new.call(params).success).to eql(expected_output)
      end
    end

    context 'when upper-case' do
      let(:params) { Hash[original_url: "www.GOOGLE.com"] }

      it 'removes white spaces' do
        expect(described_class.new.call(params).success).to eql(expected_output)
      end
    end
  end
end