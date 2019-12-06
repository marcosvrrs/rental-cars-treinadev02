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

  def create
    @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
    if @manufacturer.save
      redirect_to manufacturers_path
    else

      render :new

    end

  end

  def update
    @manufacturer = Manufacturer.find(params[:id])

    if @manufacturer.update(params.require(:manufacturer).permit(:name))
      redirect_to manufacturers_path
    else
      
      render 'edit'

    end

  end



end
