class User < ApplicationRecord
	has_many :courses
	acts_as_follower
	acts_as_followable
	has_secure_password
	validates :username, presence: true, length: {minimum: 5}, uniqueness: true
	validates :password, length: { in: 6..20 }
	validates_email_format_of :email, :message => 'must be a valid email'
	validates :email, uniqueness: true
	
end
