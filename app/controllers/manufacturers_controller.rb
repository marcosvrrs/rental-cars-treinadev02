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

  def create
    @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
    if @manufacturer.save
      redirect_to manufacturers_path
    end

  end

end
