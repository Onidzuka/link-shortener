require 'rails_helper'

RSpec.describe ShortenedUrls::Create do
  let(:params)    { Hash[original_url: 'www.google.com', unique_key: 'q5cyy'] }

  describe '#call' do
    it 'creates a record' do
      expect{ subject.call(params) }.to change{ShortenedUrl.count}.from(0).to(1)
    end

    it 'creates a record with expected attributes' do
      subject.call(params)

      expect(ShortenedUrl.last).to have_attributes({original_url: 'www.google.com', unique_key: 'q5cyy'})
    end
  end
end