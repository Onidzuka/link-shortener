class ShortenedUrlsController < ApplicationController
  def new
    shortened_url = ShortenedUrl.new

    render :new, locals: { shortened_url: shortened_url }
  end

  def create
    CreateShortenedUrl.new.call(create_params.to_h) do |m|
      m.success do |shortened_url_object|
        redirect_to shortened_url_url(shortened_url_object)
      end

      m.failure do
        redirect_to root_url
      end
    end
  end

  def show
    shortened_url = ShortenedUrl.find(params[:id])

    render :show, locals: { shortened_url: shortened_url }
  end

  def edit
    shortened_url = ShortenedUrl.find_by_access_token!(params[:access_token])

    render :edit, locals: { shortened_url: shortened_url }
  end

  def update
    shortened_url = ShortenedUrl.find(params[:id])

    if shortened_url.update(update_params)
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def create_params
    params.require(:shortened_url).permit(:original_url)
  end

  def update_params
    params.require(:shortened_url).permit(:expires_at)
  end
end
