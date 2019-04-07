require 'rails_helper'

RSpec.feature 'View shortened link as admin', type: :feature do
  let(:shortented_url) { create(:shortened_url, original_url: 'https://www.google.com/', views_count: 5) }

  scenario 'admin successfully views an admin link' do
    visit shortened_url_url(shortented_url)

    click_link admin_url(shortented_url.access_token)

    expect(page).to have_content("Views count: 5")
  end
end