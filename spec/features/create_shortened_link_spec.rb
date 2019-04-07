require 'rails_helper'

RSpec.feature 'Create shortened link', type: :feature do
  scenario 'user successfully creates a shortened link' do
    visit '/'

    fill_in 'shortened_url[original_url]', with: 'www.google.com/crazy/long/path'

    click_button 'Shorten'

    expect(page).to have_link(link_translator_url(ShortenedUrl.last.reload.unique_key))
    expect(page).to have_link(admin_url(ShortenedUrl.last.access_token))
  end
end