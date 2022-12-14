class Comment < ApplicationRecord
  belongs_to :article
  validates :body, length: {maximum: 4000}
end
