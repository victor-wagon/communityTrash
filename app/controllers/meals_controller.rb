class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  def index
    @meals = policy_scope(Meal)
  end

  def new
    @meal = Meal.new
    authorize @meal
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    authorize @meal
    if @meal.save
      redirect_to meals_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @meal.user = current_user
    if @meal.update(meal_params)
      redirect_to meals_path
    else
      render 'edit'
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:title, :description, :rating, :capacity)
  end

  def set_meal
    @meal = Meal.find(params[:id])
    authorize @meal
  end
end
