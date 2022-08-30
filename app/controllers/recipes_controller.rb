class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.where(user: current_user)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = RecipeFood.where(recipe_id: params[:id]).includes(:food)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path(@recipe), notice: 'Your new recipe has been created successfully'
    else
      redirect_to new_recipe_path, notice: 'Ops! something went wrong!'
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    @recipe.update(public: !@recipe.public)
    redirect_to recipe_path(@recipe.id), notice: 'Recipe status updated'
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
