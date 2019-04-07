class LinkTranslatorsController < ApplicationController
  def show
    shortened_url = ShortenedUrl.find_by_unique_key!(params[:unique_key])
    shortened_url.increment!(:views_count, 1)

    redirect_to shortened_url.original_url
  end
end
