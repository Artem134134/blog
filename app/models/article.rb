class Article < ApplicationRecord
  # dependent: :destroy - удаление комментариев связанных со статьёй!
  has_many :comments, dependent: :destroy 
  
  validates :title, presence: true, length: {in: 2..100}
  validates :text, presence: true, length: {in: 2..1000}
 
   def truncated_text(max_length = 150)
    if text.length > max_length
      "#{text[0...max_length]}... <small>continued</small>"
    else
      text
    end
  end
end