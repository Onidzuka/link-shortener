require 'rails_helper'

RSpec.feature 'View shortened link', type: :feature do
  let(:shortented_url) { create(:shortened_url, original_url: 'https://www.google.com/') }

  scenario 'user successfully views a shortened link' do
    visit shortened_url_url(shortented_url)

    click_link link_translator_url(shortented_url.unique_key)

    expect(page).to have_current_path('https://www.google.com/')
  end
end