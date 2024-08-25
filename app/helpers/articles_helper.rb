# frozen_string_literal: true

module ArticlesHelper
  def truncated_text(text, max_length = 150)
    if text.length > max_length
      "#{text[0...max_length]}<small>#{I18n.t('continued')}</small>"
    else
      text
    end
  end
end
