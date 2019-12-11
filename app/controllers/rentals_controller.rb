class RentalsController < ApplicationController

  def index

  end 

  def show 
    @rental = Rental.find(params[:id])

  end   

  def new 
    @rental = Rental.new 
    @clients = Client.all
    @car_categories = CarCategory.all 

  end   

  def start

    @rental = Rental.find(param[:id])
    @rental.in_progress!
    #Rental.scheduled 
    #Rental.where(status: :scheduled)
    # @rental.update(status: :in_progress)

    @car = Car.find(params[:rental][:car_id])
    @car.unavailable!
    @rental.create_car_rental(car: @car, price: @car.price )
    flash[:notice] = 'Locação iniciada com sucesso'
    redirect_to @rental 
  
  end   

  def create

    @rental = Rental.new(params.require(:rental).permit(:start_date, :end_date,
                                                        :client_id,
                                                        :car_category_id))
    if @rental.save
      redirect_to @rental , notice: 'Locação agendada com sucesso'
    else        
      @clients = Client.all
      @car_categories = CarCategory.all
      render :new
    end


  end   


  def search
    @rentals = Rental.where('reservation_code like ?', "%#{params[:q]}%" ) 
    # posso usar where ou find_by, mas find_by só retorna UM

    #TODO criar a view do search normal, ao invés de usar o render :index
    # que o prof usou ...usar @rentals.count para formatar resposta

    # render :index , reaproveitando o view da index


  end    
end   