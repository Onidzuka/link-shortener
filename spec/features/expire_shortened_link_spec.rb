require 'rails_helper'

RSpec.feature 'Expire shortened link', type: :feature do
  let(:shortented_url) { create(:shortened_url) }

  scenario 'admin successfully expires some shortened link' do
    visit admin_url(shortented_url.access_token)

    fill_in 'shortened_url[expires_at]', with: '2019-01-01'

    click_button 'Expire'

    expect(page).to have_css('.expires-at', text: 'Your link expiration date - 01-01-2019')
  end
end