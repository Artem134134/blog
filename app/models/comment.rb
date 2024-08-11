class Comment < ApplicationRecord
  belongs_to :article
  
  validates :author, presence: true, length: {in: 2..50}
  validates :body, presence: true, length: {in: 2..200}
  
end