# frozen_string_literal: true

module UsersHelper
 
  def username_or_email(user)
    return user.username if user.username.present?

    user.email.split('@')[0]
  end
end