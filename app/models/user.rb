class User < ActiveRecord::Base
	has_secure_password

	# validate :name, presence: ture
	
	has_many :reviews
	has_many :products, through: :reviews
end
