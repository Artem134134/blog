# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def formatted_created_at(obj)
    obj.created_at.strftime('pub. date %d.%m.%Y  %H:%M')
  end

  def pagination(obj)
    pagy_bootstrap_nav(obj) if obj.pages > 1
  end

  def full_title(page_title = '')
    base_title = 'Blog'

    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end

  def split_user_email(obj)
    obj.email.split('@')[0]
  end
end
