class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    if @meal.save
      redirect_to meals_path
    else
      render 'new'
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.user = current_user
    if @meal.update(meal_params)
      redirect_to meals_path
    else
      render 'edit'
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    if @meal.destroy
      redirect_to meals_path
    else
      redirect_to meals_path
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:title, :description, :rating, :capacity)
  end
end
