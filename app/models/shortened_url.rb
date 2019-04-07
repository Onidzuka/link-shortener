class ShortenedUrl < ApplicationRecord
  has_secure_token :access_token
end
