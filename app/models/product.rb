class Product < ActiveRecord::Base
	
	validates :description, :name, :url, presence: true
	validates :price, numericality: {only_integer: true}
	
	has_many :reviews
	has_many :users, through: :reviews
	
	def formatted_price
		"$%.2f" % (price.to_f / 100)
	end

end