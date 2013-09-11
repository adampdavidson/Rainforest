class ReviewsController < ApplicationController
	before_filter :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def new
  end

  def create
  	@review = @product.reviews.build(params[:review])
  	@review.user_id = current_user.id

  	if @review.save
  		redirect_to products.path, notice: 'Review successfully created'
  	else
  		render :action => :show
  	end
  end

  def edit
  end

  def destroy

  end

  private

  def load_product
  	@product = Product.find(params[:product_id])
  end

end
