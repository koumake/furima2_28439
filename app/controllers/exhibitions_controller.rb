class ExhibitionsController < ApplicationController
  def edit
    @exhibition = Exhibition.find(params[:id])
  end
  def update
    exhibition.update(exhibition_params)
  end
  def destroy
    @exhibition = Exhibitions.find(params[:id])
    @exhibition.destroy
    redirect_to root_path
  end
  def index
    @exhibitions = Exhibition.order(created_at: :DESC)
    
  end
  def new
    @exhibition = Exhibition.new
  end
  def create
    @exhibition = exhibition.new(exhibition_params)
    if @exhibition.save
        redirect_to root_path
    else
        render :new
    end
  end
  def show
    @exhibition = Exhibition.find(params[:id])
  end
  
    
       
  
  
  
  
  private
  def exhibition_params
    params.require(:exhibition).permit(:name, :image, :about, :price, :category, :condition, :delivery_fee, :from, :days)
  end
  
end
