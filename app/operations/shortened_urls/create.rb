require "dry/transaction/operation"

module ShortenedUrls
  class Create
    include Dry::Transaction::Operation

    def call(params)
      Success(ShortenedUrl.create!(params))
    end
  end
end