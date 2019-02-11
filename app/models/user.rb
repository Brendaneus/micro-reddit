class User < ApplicationRecord
	has_many :posts
	has_many :comments

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	before_save { email.downcase! }
	validates :name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 32 }
	validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
