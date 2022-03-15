class Public::ShippingAddressesController < ApplicationController
    
def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
end

def edit
    @shipping_address = ShippingAddress.find(params[:id])
end

def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      flash[:success] = '配送先を登録しました'
      redirect_to shipping_addresses_path
    else
      flash[:danger] ='必要情報を入力してください／ハイフンは使用できません'
      redirect_to shipping_addresses_path
    end
    

end 

def update
    @shipping_address = ShippingAddress.find(params[:id])
end

def destroy
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.destroy
    flash[:success] = '削除しました'
    redirect_to shipping_address_path

end

private


def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :address, :name)
end

end
