class Comment < ApplicationRecord
  belongs_to :article
  
  validates :author, presence: true, length: {maximum: 50}
  validates :body, presence: true, length: {maximum: 200}
  


  def formatted_created_on
    created_at.strftime('pub. date %d.%m.%Y  %H:%M')
  end
end