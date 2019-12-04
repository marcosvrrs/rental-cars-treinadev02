class Manufacturer < ApplicationRecord

has_many :car_models
validates :name, presence: { message: 'Falta preencher o nome'}
validates :name, uniqueness: { message: 'Nome já está em uso'}


end
