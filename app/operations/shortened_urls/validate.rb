require "dry/transaction/operation"

module ShortenedUrls
  class Validate
    include Dry::Transaction::Operation

    def call(params)
      schema = Dry::Validation.Schema do
        required(:original_url).filled(:str?)
      end

      if schema.call(params).success?
        Success(params)
      else
        Failure(:invalid_input)
      end
    end
  end
end