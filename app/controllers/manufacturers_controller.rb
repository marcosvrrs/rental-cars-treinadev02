class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturers = Manufacturer.find(params[:id])

  end

  def new
    @manufacturer = Manufacturer.new

  end

  def edit 
  @manufacturer = Manufacturer.find(params[:id])

  
  end  

  def update 

  @manufacturer = Manufacturer.find(params.require(:manufacturer).permit(:name))
    if  @manufacturer.update 
        flash[:notice] = 'Fabricante atualizado com sucesso'
        redirect_to manufacturers_path
    else 
        flash[:alert] = 'Você deve preencher todos os campos'
        render :new 
  
    end  
  end  

  def create
    @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
    if @manufacturer.save
      flash.now[:notice] = 'Fabricante criado com sucesso'
      redirect_to manufacturers_path
    else 
      flash.now[:alert] = 'Falta preencher o nome'
      render :new 


    end

  end

end
