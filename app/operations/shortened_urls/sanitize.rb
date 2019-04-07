require "dry/transaction/operation"

module ShortenedUrls
  class Sanitize
    include Dry::Transaction::Operation

    def call(params)
      Success(sanitize(params))
    end

    private

    def sanitize(params)
      Hash[params.map { |key, value| [key, value.strip.downcase] } ]
    end
  end
end