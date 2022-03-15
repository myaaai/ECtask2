class Public::CartItemsController < ApplicationController
     before_action :authenticate_customer!
    
def index
    @cart_items = current_customer.cart_items
    @sum = 0
    @cart_items.each do |cart_item|
    @subtotal = (Item.find(cart_item.item_id).price * 1.1 * cart_item.amount.to_i).floor
    @sum += @subtotal
    end


end

def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to cart_items_path
end

def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
end

def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path

end

def create
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if cart_item.present?
    cart_item.update(amount: cart_item.amount += params[:cart_item][:amount].to_i)
    redirect_to cart_items_path
    else 
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.save
    redirect_to cart_items_path
    end
end

private

  def cart_items_params
    params.require(:cart_item).permit(:amount, :customer_id, :item_id)
  end

end
