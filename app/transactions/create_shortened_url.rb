class CreateShortenedUrl
  include Dry::Transaction(container: ApplicationContainer)

  step :validate, with: "shortened_urls.operations.validate"
  step :sanitize, with: "shortened_urls.operations.sanitize"
  step :generate, with: "shortened_urls.operations.generate"
  step :create,   with: "shortened_urls.operations.create"
end