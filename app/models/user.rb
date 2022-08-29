class User < ApplicationRecord
  has_many :food
  has_many :recipe

  validates :name, presence: true
end
