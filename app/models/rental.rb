class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  enum status: { scheduled: 0, in_progress: 5 }
  validates :start_date, :end_date, presence: true 

  validate :end_date_must_be_greater_than_start_date

  has_one :car_rental
  has_one :car, through: :car_rental

  def end_date_must_be_greater_than_start_date
    # return unless start_date.present? || && end_date.present?
   
    if end_date < start_date  
      errors.add(:end_date, 'deve ser maior que data de início')
    end   
  end 

  def cars_available?


    #carros disponíveis
    car_models = CarModel.where(car_category: car_category)

    Car.where(car_model: car_models).count > 0 
    

    #locações agendadas
    total_rentals = Rental.where(car_category: car_category, subsidiary: subsidiary)
                          .where("start_date < ? AND end_date > ?", start_date, start_date)
                          .count
    (total_cars - total_rentals) > 0    

  end   

end
