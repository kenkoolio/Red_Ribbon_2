class ServicesController < ApplicationController
  def index
  end

  def new
  end

  def create
    puts params
    redirect_to 'services/new'
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def service_params
    params.require(:services).permit(:name, :description, :website, :hours)
  end

  def address_params
    params.require(:address).permit(:number, :name, :city, :state, :zip)
  end
end
