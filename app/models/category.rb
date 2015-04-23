class Category < ActiveRecord::Base
	has_many :products

	def self.category_names
    Category.all.map { |c| c.name}
	end
end
