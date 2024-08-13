# frozen_string_literal: true

require 'rails_helper'

feature 'Creating Contact' do
  scenario 'allows acees to contacts page' do
    visit new_contacts_path

    expect(page).to have_content I18n.t('contacts.contact_us')
  end

  scenario 'allows a guest to create contact' do
    visit new_contacts_path

    fill_in :contact_email, with: 'user@example.com'
    fill_in :contact_message, with: 'Bla bla car'

    click_button 'Send message'

    expect(page).to have_content 'Thanks!'
  end
end
