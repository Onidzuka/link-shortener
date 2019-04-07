class ApplicationContainer
  extend Dry::Container::Mixin

  namespace "shortened_urls" do
    namespace "operations" do
      register "validate" do
        ShortenedUrls::Validate.new
      end

      register "sanitize" do
        ShortenedUrls::Sanitize.new
      end

      register "generate" do
        ShortenedUrls::Generate.new
      end

      register "create" do
        ShortenedUrls::Create.new
      end
    end
  end
end