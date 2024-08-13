# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :email, presence: true, length: { in: 5..100 }
  validates :message, presence: true, length: { in: 2..200 }
end
