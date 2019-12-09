require 'rails_helper'

RSpec.describe Rental, type: :model do
  describe '.end_date_must_be_greater_than_start_date' do   
    it 'success' do   
      client = Client.create!(name: 'Fulano Sicrano', email: 'fulano@test.com',
                              document: '743.341.870-99')
      category = CarCategory.create!(name: 'A', daily_rate: 30, car_insurance: 30,
                                     third_party_insurance: 30)
      
      
      rental = Rental.new(start_date: '09/12/2019', end_date: '10/12/2019',
                          client: client , car_category: category)

      rental.valid?

      expect(rental.errors).to be_empty 
      # expect(rental.errors.empty?).to eq true 
    end 

    it 'end date less than start date' do   

      rental = Rental.new(start_date: '09/12/2019', end_date: '08/12/2019',
                          client: client , car_category: category)
      rental.valid?

      expect(rental.errors).to include 'End date deve ser maior que data de início'

    end   


    xit 'end date equal than start date' do   

    end   

    xit 'start date must exist '  do    

    end    

    xit 'end date must exist '   do    

    end    

  end   
end
