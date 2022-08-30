class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food.recipe_id = @recipe.id

    if @recipe_food.save
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Ingredient has been added successfully!'
    else
      flash[:alert] = 'Failed creating ingredient'
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    recipe_food = RecipeFood.find(params[:id])

    if recipe_food.update(recipe_food_params)
      redirect_to recipe_path(recipe_food.recipe_id), notice: 'Ingredient has been edited successfully!'
    else
      redirect_to recipe_path(recipe_food.recipe_id), alert: 'An error occurred. Please try again.'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy!
    redirect_to recipe_path(@recipe_food.recipe.id), notice: 'Recipe has been deleted successfully!'
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :food_id, :quantity)
  end
end