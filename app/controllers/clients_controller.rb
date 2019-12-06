class ClientsController < ApplicationController


  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params.require(:client).permit(:name, :document, :email))

    if @client.save
      redirect_to clients_path
    else
      render :new
    end

  end

end
