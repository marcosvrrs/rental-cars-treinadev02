class SubsidiariesController < ApplicationController

def index
  @subsidiaries = Subsidiary.all

end

def new

  @subsidiary = Subsidiary.new

end

def show

@subsidiaries = Subsidiary.find(params[:id])

end

def create

  @subsidiary = Subsidiary.create(params.require(:subsidiary).permit(:name, :cnpj, :adress))
  if @subsidiary.save!
    redirect_to subsidiaries_path
  end


end

def update
  @subsidiary = Subsidiary.find(params[:id])
  if @subsidiary.update(params.require(:subsidiary).permit(:name, :cnpj, :adress ))
    redirect_to subsidiaries_path
  end

end

def edit

  @subsidiary = Subsidiary.find(params[:id])



end


end
