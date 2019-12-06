class Client < ApplicationRecord

  validates :name, :document, :email, presence:true
  validates :name, :document, :email, uniqueness:true 

end
