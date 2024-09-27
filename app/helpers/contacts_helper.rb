# frozen_string_literal: true

module ContactsHelper
  def valid_email?(email)
    # Регулярное выражение для проверки формата email
    regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    regex.match?(email)
  end
end
