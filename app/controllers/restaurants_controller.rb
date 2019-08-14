class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @show_edit = true
    @restaurants = Restaurant.all
  end

  def new
    @show_back = true
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @show_review = true
    @review = Review.new
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

end
