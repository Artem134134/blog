require 'rails_helper'

feature "Account Creation" do 
  scenario "allows guest to create account" do 
    visit  new_user_registration_path

    fill_in :user_email, :with => 'user@gmail.com'
    fill_in :user_username, :with => 'user'
    fill_in :user_password, :with => 'example123NOz'
    fill_in :user_password_confirmation, :with => 'example123NOz'

    click_button 'Sign up'

    expect(page).to have_content I18n.t('devise.registrations.signed_up')
  end
end