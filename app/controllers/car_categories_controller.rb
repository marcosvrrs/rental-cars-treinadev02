class CarCategoriesController < ApplicationController

  def index
    @car_categories = CarCategory.all

  end

  def new
    @car_categories = CarCategory.new
  end

  def edit
    @car_categories = CarCategory.find(params[:id])
  end

  def create
    @car_categories = CarCategory.new(params.require(:car_category).permit(:name, :daily_rate,
                                                                           :car_insurance, :third_party_insurance))
    if @car_categories.save
      redirect_to car_categories_path

    end
  end

  def update
    @car_categories = CarCategory.find(params[:id])

    if @car_categories.update(params.require(:car_category).permit(:name,:daily_rate,
                                                                   :car_insurance, :third_party_insurance))
      redirect_to car_categories_path
    else
      render :edit

    end

  end


end
