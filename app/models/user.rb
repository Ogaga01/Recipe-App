class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :food, dependent: :delete_all
  has_many :recipe, dependent: :delete_all

  validates :name, presence: true
end
