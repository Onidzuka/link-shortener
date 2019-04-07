require "dry/transaction/operation"

module ShortenedUrls
  class Sanitize
    include Dry::Transaction::Operation

    def call(params)
      Success(sanitize(params))
    end

    private

    def sanitize(params)
      sanitized_url = params[:original_url]
      sanitized_url.strip.downcase
    end
  end
end