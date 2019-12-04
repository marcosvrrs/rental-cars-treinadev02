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
  @subsidiary.update(params.require(:subsidiary).permit(:name, :cnpj, :adress ))
  flash[:notice] = 'Atualizado com sucesso!'
  redirect_to subsidiaries_path
  

end

def edit

  @subsidiary = Subsidiary.find(params[:id])



end


end
