require 'rails_helper'

RSpec.describe ShortenedUrls::Sanitize do
  describe '#call' do
    context 'when white spaces' do
      let(:params) { Hash[original_url: "   www.google.com  \n"] }

      it 'removes white spaces' do
        expected_string = 'www.google.com'

        expect(described_class.new.call(params).success).to eql(expected_string)
      end
    end

    context 'when upper-case' do
      let(:params) { Hash[original_url: "www.GOOGLE.com"] }

      it 'removes white spaces' do
        expected_string = 'www.google.com'

        expect(described_class.new.call(params).success).to eql(expected_string)
      end
    end
  end
end