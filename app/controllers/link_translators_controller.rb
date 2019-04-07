class LinkTranslatorsController < ApplicationController
  def show
    shortened_url = ShortenedUrl.find_by_unique_key!(params[:unique_key])

    if link_expired?(shortened_url)
      not_found
    else
      shortened_url.increment!(:views_count, 1)

      redirect_to shortened_url.original_url
    end
  end

  private

  def link_expired?(shortened_url)
    shortened_url.expires_at.present? && (shortened_url.expires_at < DateTime.current)
  end
end