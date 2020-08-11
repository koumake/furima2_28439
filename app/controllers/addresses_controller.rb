class AddressesController < ApplicationController
  def create
    address.create(address_params)
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :house_number, :building_name,)
  end
end
