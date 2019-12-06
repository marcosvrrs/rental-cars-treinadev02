class ManufacturersController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_manufacturer, only: [:show, :edit, :update]

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


private

def authorize_admin

  unless current_user.admin?
    flash[:notice] = 'Você não tem autorização para realizar esta ação'
    redirect_to root_path
  end    
end   
#verificar se esses ends fecharam correto, unless precisa fechar o end?



end
