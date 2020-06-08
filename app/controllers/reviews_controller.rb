class ReviewsController < ApplicationController
  before_action :set_meal, only: %i[new create]

  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.meal = @meal
    if @review.save
      redirect_to meal_path(@meal)
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end

end
