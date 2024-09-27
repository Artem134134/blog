# frozen_string_literal: true

class Article < ApplicationRecord
  include Authorship
  # dependent: :destroy - удаление комментариев связанных со статьёй!
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { in: 2..100 }
  validates :text, presence: true, length: { in: 2..1000 }
end
