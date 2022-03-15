class Admin::OrdersController < ApplicationController
 before_action :authenticate_admin!
 
def index
    @orders = Order.all
end

def show
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
    @sum = calculate(@ordered_items)
    
end

def update

end


private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def calculate(ordered_items)
    total_price = 0
    ordered_items.each do |ordered_item|
    total_price += ordered_item.item.price * ordered_item.amount
  end
  return (total_price * 1.1).floor
  end

end
