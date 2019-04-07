require "dry/transaction/operation"

module ShortenedUrls
  class Create
    include Dry::Transaction::Operation

    STRING_LENGTH = 5.freeze

    attr_accessor :generator

    def initialize(string_generator)
      self.generator = string_generator
    end

    def call(input)
      Success(ShortenedUrl.create!(input.merge({unique_key: unique_key})))
    end

    private

    def unique_key
      self.generator.generate(STRING_LENGTH)
    end
  end
end