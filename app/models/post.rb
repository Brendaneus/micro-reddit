class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  VALID_LINK_REGEX = /\A(https?:\/\/)?(\w[\w\-]+\.)?\w[\w\-\.]*\.\w+(\/[\w\-\/\.]*[\w\-]+\w)?\z/i

  before_save { hyperlink.downcase! }
  validates :user, presence: true
  # add http agent to check for validity and redirects
  validates :hyperlink, presence: true, uniqueness: true, format: { with: VALID_LINK_REGEX }
  validates :title, presence: true, length: { minimum: 4, maximum: 32 }
  # change to validate uniqueness if character limit is reached
  validates :body, presence: true, uniqueness: true, length: { minimum: 16, maximum: 1024 }
end
