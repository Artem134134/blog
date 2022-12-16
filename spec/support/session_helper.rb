def sign_up
   visit  new_user_registration_path

    fill_in :user_email, :with => 'user@gmail.com'
    fill_in :user_username, :with => 'user'
    fill_in :user_password, :with => 'example123NOz'
    fill_in :user_password_confirmation, :with => 'example123NOz'

    click_button 'Sign up'
end