class Article < ApplicationRecord
  validates :title, presence: true
  validates :text,  presence: true
  validates :title, length: {maximum: 60}
  validates :text,  length: {maximum: 1000}
  has_many :comments

  def subject
    title
  end

  def last_comment
    comments.last
  end

end
 