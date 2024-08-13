# frozen_string_literal: true

class Article < ApplicationRecord
  # dependent: :destroy - удаление комментариев связанных со статьёй!
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { in: 2..100 }
  validates :text, presence: true, length: { in: 2..1000 }
end
