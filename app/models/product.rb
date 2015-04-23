class Product < ActiveRecord::Base
	
	validates :description, :name, :url, presence: true
	validates :price, numericality: {only_integer: true}
	
	has_many :reviews, dependent: :destroy
	has_many :users, through: :reviews
	belongs_to :category
	
	def formatted_price
		"$%.2f" % (price.to_f / 100)
	end

end