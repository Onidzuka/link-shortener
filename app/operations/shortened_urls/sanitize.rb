require "dry/transaction/operation"

module ShortenedUrls
  class Sanitize
    include Dry::Transaction::Operation

    def call(params)
      sanitized_url = params[:original_url]

      Success(sanitized_url.strip.downcase)
    end
  end
end