class ProductsController < ApplicationController
  before_filter :ensure_logged_in, only: [:new, :edit, :destroy]

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to product_path(@product)
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])

		if current_user
			@review = @product.reviews.build
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			redirect_to product_path(@product)
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

  private
  def product_params
  	params.require(:product).permit(:name, :description, :price, :url, :category_id)
  end

end