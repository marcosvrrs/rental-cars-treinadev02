class Subsidiary < ApplicationRecord
  validates :name, :cnpj, :adress,  presence: true
  validates :name, :cnpj, :adress, uniqueness: true
  has_many :cars 
end
