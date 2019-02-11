class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user, presence: true
  validates :post, presence: true
  validates :body, presence: true, length: { minimum: 4, maximum: 256 }
end
