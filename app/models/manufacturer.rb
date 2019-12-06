class Manufacturer < ApplicationRecord
  validates :name, presence: true , uniqueness: true
  validates :name, length: {minimum: 3}
  has_many :car_models
end
