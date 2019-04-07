require 'rails_helper'

RSpec.describe CreateShortenedUrl do
  let(:input) { Hash[original_url: 'www.google.com'] }

  describe '#call' do
    it 'creates an applicant' do
      expect{ subject.call(input) }.to change{ ShortenedUrl.count }.from(0).to(1)
    end
  end
end