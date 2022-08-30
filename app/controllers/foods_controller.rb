class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to foods_path, notice: 'Your food has been added successfully!'
    else
      redirect_to new_food_path, notice: 'Ops! Something went wrong!'
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    if @food.update(food_params)
      redirect_to food_url(@food), notice: 'Food was successfully updated.'

    else
      render :edit, status: :unprocessable_entity

    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to foods_path, notice: 'Your food was deleted successfully!'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :user_id, :measurement_unit, :price, :quantity)
  end
end
