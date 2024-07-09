class Article < ApplicationRecord
  # dependent: :destroy - удаление комментариев связанных со статьёй!
  has_many :comments, dependent: :destroy 

  validates :title, presence: true
  validates :text,  presence: true
  validates :title, length: {maximum: 60}
  validates :text,  length: {maximum: 1000}
 

  def subject
    title
  end

  def last_comment
    comments.last
  end

end
 