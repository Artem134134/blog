class Article < ApplicationRecord
  # dependent: :destroy - удаление комментариев связанных со статьёй!
  has_many :comments, dependent: :destroy 
  
  validates :title, presence: true, length: {in: 2..100}
  validates :text, presence: true, length: {in: 2..1000}
 
  def subject
    title
  end

  def last_comment
    comments.last
  end

  def formatted_created_at
		created_at.strftime('pub. date %d.%m.%Y  %H:%M')
	end

end
 