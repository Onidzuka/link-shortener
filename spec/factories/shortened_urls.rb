FactoryBot.define do
  factory :shortened_url do
    original_url { "MyText" }
    unique_key { "12345" }
    views_count { 0 }
    access_token { "1234567" }
  end
end
