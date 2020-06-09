class ReviewsController < ApplicationController
  before_action :set_meal, only: %i[new create]
  before_action :set_review, only: %i[destroy]

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
    if @review.destroy
      redirect_to meal_path(@review.meal)
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
