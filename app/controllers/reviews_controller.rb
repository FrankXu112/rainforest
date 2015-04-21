class ReviewsController < ApplicationController

  before_filter :ensure_logged_in, only: [:create, :destroy]
  
  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to "/products/#{@product.id}", notice: "Review created successfully!"
    else
      render 'product/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id )
  end

end
