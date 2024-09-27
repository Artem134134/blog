# frozen_string_literal: true

class Comment < ApplicationRecord
  include Authorship
  
  belongs_to :article
  belongs_to :user

  validates :author, presence: true, length: { in: 2..50 }
  validates :body, presence: true, length: { in: 2..200 }
end
