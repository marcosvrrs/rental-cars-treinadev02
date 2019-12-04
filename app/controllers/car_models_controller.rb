class CarModelsController < ApplicationController

  def index

  end

  def new 
    @car_model = CarModel.new 
    @manufacturers = Manufacturer.all 
    @categories = CarCategory.all 


  end   

  def create
    @car_model = CarModel.new(params.require(:car_model).permit(:name, :year, :motorization, 
                                                                :fuel_type, :car_category_id,
                                                                :manufacturer_id))
    if @car_model.save
      flash[:notice] = 'Modelo registrado com sucesso'
      redirect_to @car_model  
    else 
      @manufacturers = Manufacturer.all 
      @categories = CarCategory.all 
      flash[:alert] = 'Erro'
      render :new 
    end    

  end 

  def show
    @car_model = CarModel.find(params[:id])

  end    

end 