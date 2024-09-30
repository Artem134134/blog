# frozen_string_literal: true

class Contact < ApplicationRecord
  include Authorship
  
  belongs_to :user

  validates :email, presence: true, length: { in: 5..50 }
  validates :message, presence: true, length: { in: 2..200 }
end
