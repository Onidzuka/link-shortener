require 'rails_helper'

RSpec.describe ShortenedUrls::Create do
  let(:params)    { Hash[original_url: 'www.google.com'] }
  let(:generator) { double(:generator, generate: 'q5cyy') }

  describe '#call' do
    it 'creates a record' do
      expect{ described_class.new(generator).call(params) }.to change{ShortenedUrl.count}.from(0).to(1)
    end

    it 'creates a record' do
      described_class.new(generator).call(params)

      expect(ShortenedUrl.last).to have_attributes({original_url: 'www.google.com', unique_key: 'q5cyy'})
    end

    it 'passes string length to generator' do
      expect(generator).to receive(:generate).with(5)

      described_class.new(generator).call(params)
    end
  end
end