class RecipeFood < ApplicationRecord
    belongs_to :food
    belongs_to :recipe

    validates :name, presence: true
    validates :preparation_time, presence: true
    validates :cooking_time, presence: true
end
