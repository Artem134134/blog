class Comment < ApplicationRecord
  belongs_to :article
  
  validates :author, presence: true, length: {in: 2..50}
  validates :body, presence: true, length: {in: 2..200}
  


  def formatted_created_at
    created_at.strftime('pub. date %d.%m.%Y  %H:%M')
  end
end