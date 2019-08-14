class ReviewsController < ApplicationController
  def new
    @review_menu = true
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    @review.restaurant = Restaurant.find(params[:restaurant_id])

    if @review.save
      redirect_to restaurant_path(@review.restaurant.id) + "##{@review.id}"
    else
      redirect_to restaurant_path(@review.restaurant.id)
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
