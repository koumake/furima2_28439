class PurchasesController < ApplicationController
    def index
      @purchase = UserPurchase.new
      @exhibition = Exhibition.find(params[:exhibition_id])
    end
    
    def create
        @exhibition = Exhibition.find(params[:exhibition_id])
        @purchase = UserPurchase.new(user_purchase_params)
        if @purchase.valid?
            pay_item
            @purchase.save(params[:exhibition_id])
            return redirect_to root_path
        else
            render 'index'
        end
        
        
       
    end

    private
    def purchase_params
        params.permit(:token)
    end
    def user_purchase_params
        # params.require(:user_purchase).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :tel)
        params.permit(:postal_code, :prefecture, :city, :house_number, :building_name, :tel, :token)
    end
    
        
    def pay_item
        @exhibition = Exhibition.find(params[:exhibition_id])
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        
        Payjp::Charge.create(
            amount: @exhibition.price,
            card: user_purchase_params[:token],
            currency:'jpy'
        )
    end

    
end
