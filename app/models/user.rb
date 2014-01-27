class User < ActiveRecord::Base
	has_many :microposts, dependent: :destroy
	before_save { email.downcase! }
	before_save :create_remember_token
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
				uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password_confirmation, presence: true
	validates :password, length: { minimum: 6 }
	validates :permit, presence: true, inclusion: { in: %w(red purple green silver pay pool),
													message: "%{value} is not a vaild permit"}

	def feed
		#This is preliminary. See "Following users" for the full implementation
		Micropost.where("user_id = ?", id)
	end

	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end