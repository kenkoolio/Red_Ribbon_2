class ServicesController < ApplicationController
  def index
  end

  def new
  end

  def create
    redirect_to action: "new"
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
    params.require(:address).permit(:number, :street, :apt, :city, :state, :zip)
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone)
  end
end
