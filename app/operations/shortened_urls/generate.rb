require "dry/transaction/operation"

module ShortenedUrls
  class Generate
    include Dry::Transaction::Operation

    STRING_LENGTH = 5.freeze

    def call(params)
      begin
        unique_key = generate_random_string
      end while ShortenedUrl.find_by_unique_key unique_key

      Success(params.merge({unique_key: generate_random_string}))
    end

    private

    def generate_random_string
      charset = ('a'..'z').to_a + (0..9).to_a
      (0...STRING_LENGTH).map{ charset.to_a[rand(charset.size)] }.join
    end
  end
end