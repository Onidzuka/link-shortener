require 'rails_helper'

RSpec.describe ShortenedUrls::Validate do
  describe '#call' do
    context 'when input data valid' do
      let(:valid_input) { Hash[original_url: 'www.google.com'] }

      it 'returns true on #success?' do
        expect(described_class.new.call(valid_input).success?).to eql(true)
      end

      it 'input data' do
        expect(described_class.new.call(valid_input).success).to eql(valid_input)
      end
    end

    context 'when input data not valid' do
      let(:invalid_input) { Hash[original_url: ''] }

      it 'returns false on #success?' do
        expect(described_class.new.call(invalid_input).success?).to eql(false)
      end

      it 'returns :invalid_data' do
        expect(described_class.new.call(invalid_input).failure).to eql(:invalid_input)
      end
    end
  end
end