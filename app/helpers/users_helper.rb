# frozen_string_literal: true

module UsersHelper
  def username_or_email(user)
    return user.username if user.username.present?

    user.email.split('@')[0]
  end

  def gravatar(user, size: 40, css_class: '')
    image_tag "https://www.gravatar.com/avatar/#{user.gravatar_hash}.jpg?s=#{size}",
              class: "rounded #{css_class}", alt: username_or_email(user)
  end
end
